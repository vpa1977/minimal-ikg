#!/usr/bin/env bash
#
# build.sh -- bootstrap build: IntelliJ -> Kotlin -> Gradle
#
# Implements the minimal build commands from Plan.md with the layout required by Task.md:
#
#   intellij-cache/            bazel vendor directory for the IntelliJ build
#   gradle-kotlin/             GRADLE_USER_HOME for the Kotlin and Gradle builds
#   gradle-kotlin-maven-repo/  maven repository for the Kotlin and Gradle builds
#                              (locally built com.jetbrains.intellij.* and org.jetbrains.kotlin
#                              artifacts are published/copied here and consumed from here)
#
# The IntelliJ build is driven by bazel directly (NOT via installers.cmd).
# Init scripts in init-scripts/ wire the local maven repository into both Gradle builds
# and forbid remote repositories from serving the locally built artifacts.
#
# Usage:
#   ./build.sh             run everything (tools, intellij, kotlin, gradle, validate)
#   ./build.sh <step>...   run only the given steps (tools|intellij|kotlin|gradle|validate)
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INTELLIJ_DIR="$ROOT/intellij-community"
KOTLIN_DIR="$ROOT/kotlin"
GRADLE_DIR="$ROOT/gradle"
GRADLE_DIST_DIR="$ROOT/gradle-dist"

INTELLIJ_CACHE="$ROOT/intellij-cache"              # bazel vendor directory (IntelliJ build)
GRADLE_KOTLIN_HOME="$ROOT/gradle-kotlin"           # GRADLE_USER_HOME (Kotlin + Gradle builds)
GRADLE_GRADLE_HOME="$ROOT/gradle-gradle"           # GRADLE_USER_HOME (Gradle builds)
INTELLIJ_REPO="$ROOT/intellij-repo"  # maven repository (Kotlin + Gradle builds)
KOTLIN_REPO="$ROOT/kotlin-repo"  # maven repository (Kotlin + Gradle builds)
INIT_SCRIPTS_DIR="$ROOT/init-scripts"
TOOLS_DIR="$ROOT/tools"

INTELLIJ_TAG="idea/251.27812.49"
INTELLIJ_VERSION="251.27812.49"
KOTLIN_VERSION="2.4.10"

JDK17_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
JDK25_HOME="/usr/lib/jvm/java-25-openjdk-amd64"

BAZELISK_VERSION="v1.26.0"
BAZEL="$TOOLS_DIR/bazel"

# Minimal skip-set for the IntelliJ installers build: keep compilation and maven_artifacts,
# skip everything else (see Plan.md, Step 1).
INTELLIJ_SKIP_STEPS="sources_archive,search_index,broken_plugins_list,provided_modules_list,third_party_libraries,non_bundled_plugins,keymap_plugins,lib_url_check,localize,checksum_sign,mac_artifacts,mac_dmg,mac_sit,windows_artifacts,windows_zip_archive,windows_exe_installer,linux_artifacts,linux_tar_gz_without_jre,cross_platform_dist,os_specific_distributions,community_dist,repair_utility_bundle_step,doc_authoring_assets,fus_metadata_bundle_step,teamcity_artifacts_publication"

log() { printf '\n=== %s ===\n' "$*"; }

# JBR 17 (JetBrains Runtime) is required to run the IntelliJ build scripts:
# stock javac rejects `--add-exports java.base/...` combined with `--release`,
# while JBR's javac is patched to accept it (this is why jps-bootstrap downloads JBR).
JBR_VERSION="17.0.14"
JBR_BUILD="b1367.22"
JBR_HOME="$TOOLS_DIR/jbr-$JBR_VERSION-$JBR_BUILD"

# ---------------------------------------------------------------------------
# Step 0: tool installation
# ---------------------------------------------------------------------------
install_tools() {
    log "tools: installing build tools"

    local sudo=""
    if [ "$(id -u)" -ne 0 ]; then sudo="sudo"; fi

    # JDKs required by the builds (build JVM / toolchains).
    if [ ! -x "$JDK17_HOME/bin/java" ] || [ ! -x "$JDK25_HOME/bin/java" ]; then
        $sudo apt-get update
        $sudo apt-get install -y openjdk-17-jdk openjdk-25-jdk
    fi

    # Misc tools used by this script and the builds.
    local missing=()
    for tool in curl git rsync unzip zip; do
        command -v "$tool" >/dev/null 2>&1 || missing+=("$tool")
    done
    if [ "${#missing[@]}" -gt 0 ]; then
        $sudo apt-get update
        $sudo apt-get install -y "${missing[@]}"
    fi

    # C/C++ toolchain required by bazel's rules_cc auto-configuration.
    if ! command -v gcc >/dev/null 2>&1; then
        $sudo apt-get update
        $sudo apt-get install -y build-essential
    fi

    # bazelisk as `bazel` (honours intellij-community/.bazelversion).
    mkdir -p "$TOOLS_DIR"
    if [ ! -x "$BAZEL" ]; then
        curl -fsSL -o "$BAZEL" \
            "https://github.com/bazelbuild/bazelisk/releases/download/$BAZELISK_VERSION/bazelisk-linux-amd64"
        chmod +x "$BAZEL"
    fi

    # JBR 17 to run the IntelliJ build scripts (see above).
    if [ ! -x "$JBR_HOME/bin/java" ]; then
        # Reuse the copy the IntelliJ build scripts download, if present.
        local existing
        existing="$(dirname "$(dirname "$(find "$INTELLIJ_DIR/build/download" -maxdepth 3 -path '*jbrsdk*/bin/java' -type f 2>/dev/null | head -n 1)")" 2>/dev/null || true)"
        if [ -n "$existing" ] && [ -x "$existing/bin/java" ]; then
            mkdir -p "$JBR_HOME"
            rsync -a "$existing/" "$JBR_HOME/"
        else
            local tmp
            tmp="$(mktemp -d)"
            curl -fsSL -o "$tmp/jbr.tar.gz" \
                "https://cache-redirector.jetbrains.com/intellij-jbr/jbrsdk-$JBR_VERSION-linux-x64-$JBR_BUILD.tar.gz"
            mkdir -p "$JBR_HOME"
            tar -xzf "$tmp/jbr.tar.gz" -C "$JBR_HOME" --strip-components=1
            rm -rf "$tmp"
        fi
    fi

    command -v java >/dev/null 2>&1 || {
        log "tools: WARNING no default 'java' on PATH; builds use JAVA_HOME=$JDK17_HOME"
    }
}

# ---------------------------------------------------------------------------
# Directory preparation
# ---------------------------------------------------------------------------
prepare_dirs() {
    mkdir -p "$INTELLIJ_CACHE" "$GRADLE_KOTLIN_HOME" "$INTELLIJ_REPO" "$KOTLIN_REPO"
}

# ---------------------------------------------------------------------------
# Step 1: IntelliJ IDEA (bazel, NOT installers.cmd)
#
# Produces com.jetbrains.intellij.*:<version> maven artifacts and copies them
# into gradle-kotlin-maven-repo.
# ---------------------------------------------------------------------------

# The checked-out tag's lib/BUILD.bazel uses `jvm_import` in its auto-generated
# `maven libs` section without loading it, and lib/MODULE.bazel does not declare
# the repo's own rules_jvm module that defines it. Fix both (idempotently).
fix_intellij_lib_build_file() {
    # lib is a separate bazel module; make rules_jvm visible from it
    # (the root MODULE.bazel already has a local_path_override for rules_jvm).
    local lib_module="$INTELLIJ_DIR/lib/MODULE.bazel"
    local dep_line='bazel_dep(name = "rules_jvm", version = "0.0.1")'
    if ! grep -qF "$dep_line" "$lib_module"; then
        sed -i "s|^module(name = \"lib\")$|&\n\n$dep_line|" "$lib_module"
    fi

    local lib_build="$INTELLIJ_DIR/lib/BUILD.bazel"
    local load_line='load("@rules_jvm//:jvm.bzl", "jvm_import")'
    local anchor='load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_import")'
    if ! grep -qF "$load_line" "$lib_build"; then
        grep -qF "$anchor" "$lib_build" || {
            echo "ERROR: cannot patch $lib_build: anchor load statement not found" >&2
            exit 1
        }
        python3 - "$lib_build" "$anchor" "$load_line" <<'PYEOF'
import sys
path, anchor, load_line = sys.argv[1], sys.argv[2], sys.argv[3]
with open(path) as f:
    s = f.read()
s = s.replace(anchor + "\n", anchor + "\n" + load_line + "\n", 1)
with open(path, "w") as f:
    f.write(s)
PYEOF
    fi
}

# The JPS build inside OpenSourceCommunityInstallersBuildTarget resolves the project's
# maven libraries into ~/.m2. Its aether session conflict-resolves bcprov/bcutil-jdk18on
# to 1.80.2 (pulled in by another library) and never downloads the 1.80 artifacts that
# the 'bouncy-castle-provider' library expects verbatim, so the build aborts with
# "not found expected artifacts". Pre-seed the exact artifacts (idempotent).
seed_intellij_m2_deps() {
    local m2="${MAVEN_REPOSITORY:-$HOME/.m2/repository}/org/bouncycastle"
    local base="https://repo1.maven.org/maven2/org/bouncycastle"
    local art ext dir
    for art in bcprov-jdk18on bcutil-jdk18on; do
        dir="$m2/$art/1.80"
        mkdir -p "$dir"
        for ext in jar pom; do
            [ -f "$dir/$art-1.80.$ext" ] || \
                curl -fsSL -o "$dir/$art-1.80.$ext" "$base/$art/1.80/$art-1.80.$ext"
        done
    done
}

# The checked-out tag ships build/BUILD.bazel with only the auto-generated jvm_library.
# Add the java_binary target that runs OpenSourceCommunityInstallersBuildTarget
# (this is the target installers.cmd wraps; we call it with bazel directly).
ensure_intellij_bazel_target() {
    local build_file="$INTELLIJ_DIR/build/BUILD.bazel"
    # Remove any previously generated block, then append a fresh one (idempotent).
    awk '
        /^# >>> build.sh:i_build_target >>>$/ { skip=1; next }
        /^# <<< build.sh:i_build_target <<<$/ { skip=0; next }
        !skip { print }
    ' "$build_file" > "$build_file.tmp" && mv "$build_file.tmp" "$build_file"

    cat >> "$build_file" <<EOF
# >>> build.sh:i_build_target >>>
load("@rules_java//java:defs.bzl", "java_binary")

java_binary(
    name = "i_build_target",
    main_class = "OpenSourceCommunityInstallersBuildTarget",
    runtime_deps = [":build"],
)
# <<< build.sh:i_build_target <<<
EOF
}

# ~99% of intellij-community/android/ (the Android Studio plugin sources) is not
# needed by the platform build: bazel never references it, and the only android
# maven artifacts ever published are the 7 com.jetbrains.intellij.android:*
# gradle-dsl / declarative-lang modules. Trim everything except those 9 source
# dirs (see Trim-Android.md for the full analysis). Idempotent, unconditional.
trim_android() {
    local android_dir="$INTELLIJ_DIR/android"
    [ -d "$android_dir" ] || return 0

    # .git (nested repo metadata) is kept so the trim stays reversible via
    # `git -C intellij-community/android checkout -- .`
    local keep=(
        .git LICENSE.txt README.md
        gradle-dsl gradle-dsl-flags gradle-dsl-toml gradle-dsl-kotlin
        gradle-dsl-declarative gradle-dsl-groovy
        gradle-declarative-lang gradle-declarative-lang-sync gradle-declarative-lang-ide
    )

    local trimmed=0
    local entry name k drop
    while IFS= read -r entry; do
        name="$(basename "$entry")"
        drop=1
        for k in "${keep[@]}"; do
            if [ "$name" = "$k" ]; then drop=0; break; fi
        done
        if [ "$drop" -eq 1 ]; then
            rm -rf "$entry"
            trimmed=1
        fi
    done < <(find "$android_dir" -mindepth 1 -maxdepth 1)

    if [ "$trimmed" -eq 1 ]; then
        log "intellij: trimmed android/ (kept: ${keep[*]})"
        # Stale JPS caches (incrementalCompilation=true) reference deleted modules.
        rm -rf "$INTELLIJ_DIR/out/idea-ce"
    fi

    # checkProductLayout validates every productLayout.pluginLayouts entry with
    # findRequiredModule, so the androidPlugin layout (full of intellij.android.*
    # modules) must be removed. Idempotent: skip if already removed; fail loudly
    # if the anchor is not found (mirrors fix_intellij_lib_build_file).
    local props="$INTELLIJ_DIR/build/src/org/jetbrains/intellij/build/IdeaCommunityProperties.kt"
    local plugin_line='CommunityRepositoryModules.androidPlugin(allPlatforms = true),'
    local anchor='CommunityRepositoryModules.groovyPlugin(),'
    if grep -qF "$plugin_line" "$props"; then
        grep -qF "$anchor" "$props" || {
            echo "ERROR: cannot patch $props: anchor '$anchor' not found" >&2
            exit 1
        }
        sed -i "\|CommunityRepositoryModules\.androidPlugin(allPlatforms = true),|d" "$props"
    fi

    # COMMUNITY_REPOSITORY_PLUGINS also contains androidDesignPlugin(), which
    # references the deleted intellij.android.design-plugin.descriptor modules.
    # Remove it from the list and drop the now-unused private helper.
    local repo_modules="$INTELLIJ_DIR/platform/build-scripts/src/org/jetbrains/intellij/build/CommunityRepositoryModules.kt"
    if grep -qF 'androidDesignPlugin(),' "$repo_modules"; then
        python3 - "$repo_modules" <<'PYEOF'
import sys, re
path = sys.argv[1]
with open(path) as f:
    s = f.read()
# Remove the entry from COMMUNITY_REPOSITORY_PLUGINS.
s = re.sub(r'\n    androidDesignPlugin\(\),\n', '\n', s, count=1)
# Remove the private helper function (multiline, up to the next fun/val/private fun).
s = re.sub(
    r'\n  private fun androidDesignPlugin\(.*?\n  (?=fun androidPlugin|val supportedFfmpegPresets)',
    '\n  ',
    s,
    count=1,
    flags=re.DOTALL,
)
with open(path, "w") as f:
    f.write(s)
PYEOF
    fi

    # Cosmetic: JPS would skip the missing .iml files anyway, but filtering the
    # android entries keeps the build logs clean. Entries for the kept dirs must
    # stay: their modules are bundled plugins / publish the android artifacts.
    local modules_xml="$INTELLIJ_DIR/.idea/modules.xml"
    if grep -qF '$PROJECT_DIR$/android/' "$modules_xml"; then
        python3 - "$modules_xml" <<'PYEOF'
import sys
path = sys.argv[1]
keep = (
    "gradle-dsl", "gradle-dsl-flags", "gradle-dsl-toml", "gradle-dsl-kotlin",
    "gradle-dsl-declarative", "gradle-dsl-groovy",
    "gradle-declarative-lang", "gradle-declarative-lang-sync",
    "gradle-declarative-lang-ide",
)
prefix = "$PROJECT_DIR$/android/"
with open(path) as f:
    lines = f.readlines()
out = [l for l in lines
       if prefix not in l or any(prefix + k + "/" in l for k in keep)]
with open(path, "w") as f:
    f.writelines(out)
PYEOF
    fi
}

build_intellij() {
    log "intellij: checking out $INTELLIJ_TAG"
    # If HEAD already contains the required tag (e.g. local patches on top),
    # leave it alone so fixes/commits are not reset.
    if ! git -C "$INTELLIJ_DIR" merge-base --is-ancestor "$INTELLIJ_TAG" HEAD 2>/dev/null; then
        git -C "$INTELLIJ_DIR" checkout -q "$INTELLIJ_TAG"
    fi

    trim_android
    ensure_intellij_bazel_target
    fix_intellij_lib_build_file
    seed_intellij_m2_deps

    # NOTE: the tag's MODULE.bazel.lock (lockFileVersion 16) is not readable by the
    # bazel 8.1.0 pinned in .bazelversion, so the lockfile is disabled.
    # --vendor_dir vendors all external dependencies into intellij-cache/.
    log "intellij: bazel vendor -> $INTELLIJ_CACHE"
    (cd "$INTELLIJ_DIR" && "$BAZEL" vendor \
        --lockfile_mode=off \
        --vendor_dir="$INTELLIJ_CACHE" \
        //build:i_build_target)

    # Build the launcher with bazel (this replaces installers.cmd), then execute the
    # resulting deploy jar with JBR 17 (like jps-bootstrap does):
    #  - the IDE modules target JBR 17, so with a matching build JVM JPS compiles
    #    in-process (the forked external-javac netty handshake hangs in some
    #    environments);
    #  - JBR's javac is patched to accept `--add-exports java.base/...` together with
    #    `--release`, which stock javac rejects.
    # (bazel's own remotejdk toolchains cannot provide JBR, and an extra_toolchains
    # override would also downgrade the tool configuration used to build bazel's own
    # java tools, so the launch is done with the JBR binary directly.)
    log "intellij: bazel build //build:i_build_target_deploy.jar"
    (cd "$INTELLIJ_DIR" && "$BAZEL" build \
        --lockfile_mode=off \
        --vendor_dir="$INTELLIJ_CACHE" \
        --remote_cache= \
        --bes_backend= \
        //build:i_build_target_deploy.jar)

    local deploy_jar="$INTELLIJ_DIR/out/bazel-bin/build/i_build_target_deploy.jar"
    [ -f "$deploy_jar" ] || {
        echo "ERROR: $deploy_jar not found after bazel build" >&2
        exit 1
    }

    log "intellij: running OpenSourceCommunityInstallersBuildTarget (maven artifacts)"
    (cd "$INTELLIJ_DIR" && "$JBR_HOME/bin/java" \
        "--add-opens=java.base/java.lang=ALL-UNNAMED" \
        -Xmx4g \
        -Djava.awt.headless=true \
        -Dintellij.build.community.home.path="$INTELLIJ_DIR" \
        -Dintellij.build.skip.build.steps="$INTELLIJ_SKIP_STEPS" \
        -Dbuild.number="$INTELLIJ_VERSION" \
        -jar "$deploy_jar")

    log "intellij: copying maven artifacts into $INTELLIJ_REPO"
    local maven_artifacts="$INTELLIJ_DIR/out/idea-ce/artifacts/maven-artifacts"
    if [ ! -d "$maven_artifacts" ]; then
        # Fallback: locate the produced maven repository.
        maven_artifacts="$(find "$INTELLIJ_DIR/out" -type d -name maven-artifacts | head -n 1 || true)"
    fi
    [ -n "$maven_artifacts" ] && [ -d "$maven_artifacts" ] || {
        echo "ERROR: IntelliJ maven artifacts not found under $INTELLIJ_DIR/out" >&2
        exit 1
    }
    rsync -a "$maven_artifacts/" "$INTELLIJ_REPO/"
}

# ---------------------------------------------------------------------------
# Step 2: Kotlin
#
# Publishes the org.jetbrains.kotlin artifacts Gradle 9.8.0 needs (version 2.4.10)
# into gradle-kotlin-maven-repo. GRADLE_USER_HOME is gradle-kotlin/.
# The init script makes gradle-kotlin-maven-repo the only source of
# com.jetbrains.intellij.* artifacts (produced in Step 1).
# ---------------------------------------------------------------------------
build_kotlin() {
    log "kotlin: publishing $KOTLIN_VERSION artifacts to $KOTLIN_REPO"
    (cd "$KOTLIN_DIR" && \
        rm -f gradle/verification-metadata.xml && \
        GRADLE_USER_HOME="$GRADLE_KOTLIN_HOME" \
        JAVA_HOME="$JDK17_HOME" \
        ./gradlew \
            -Pbuild.number="$KOTLIN_VERSION" \
            -Dmaven.repo.local="$KOTLIN_REPO" \
            -Dintellij.repo="$INTELLIJ_REPO" \
            -I "$INIT_SCRIPTS_DIR/local-repos-kotlin.init.gradle.kts" \
            :kotlinx-serialization-compiler-plugin.embeddable:publishToMavenLocal \
            :kotlin-stdlib-common:publishToMavenLocal \
            :kotlin-util-klib:publishToMavenLocal \
            :kotlin-gradle-plugin-idea:publishToMavenLocal \
            :kotlin-gradle-plugin-idea-proto:publishToMavenLocal \
            :native:kotlin-klib-commonizer-api:publishToMavenLocal \
            :compiler:build-tools:kotlin-build-statistics:publishToMavenLocal \
            :kotlin-util-klib-metadata:publishToMavenLocal \
            :kotlin-util-io:publishToMavenLocal \
            :libraries:tools:gradle:fus-statistics-gradle-plugin:publishToMavenLocal \
            :kotlin-gradle-plugin-annotations:publishToMavenLocal \
            :native:kotlin-native-utils:publishToMavenLocal \
            :kotlin-gradle-plugins-bom:publishToMavenLocal \
            :kotlin-daemon-client:publishToMavenLocal \
            :kotlin-tooling-core:publishToMavenLocal \
            :kotlin-compiler-runner:publishToMavenLocal \
            :compiler:build-tools:kotlin-build-tools-compat:publishToMavenLocal \
            :compiler:build-tools:kotlin-build-tools-cri-impl:publishToMavenLocal \
            :compiler:build-tools:kotlin-build-tools-impl:publishToMavenLocal \
            :kotlin-daemon-embeddable:publishToMavenLocal \
            :kotlin-stdlib:publishToMavenLocal \
            :kotlin-reflect:publishToMavenLocal \
            :kotlin-metadata-jvm:publishToMavenLocal \
            :kotlin-script-runtime:publishToMavenLocal \
            :kotlin-scripting-common:publishToMavenLocal \
            :kotlin-scripting-jvm:publishToMavenLocal \
            :kotlin-scripting-jvm-host:publishToMavenLocal \
            :kotlin-scripting-compiler-embeddable:publishToMavenLocal \
            :kotlin-scripting-compiler-impl-embeddable:publishToMavenLocal \
            :kotlin-compiler-embeddable:publishToMavenLocal \
            :compiler:build-tools:kotlin-build-tools-api:publishToMavenLocal \
            :compiler:build-tools:kotlin-build-tools-impl:publishToMavenLocal \
            :kotlin-gradle-plugin-api:publishToMavenLocal \
            :kotlin-gradle-plugin:publishToMavenLocal \
            :kotlin-sam-with-receiver:publishToMavenLocal \
            :kotlin-sam-with-receiver-compiler-plugin:publishToMavenLocal \
            :kotlin-sam-with-receiver-compiler-plugin.embeddable:publishToMavenLocal \
            :kotlin-assignment:publishToMavenLocal \
            :kotlin-assignment-compiler-plugin.embeddable:publishToMavenLocal \
            :plugins:jvm-abi-gen-embeddable:publishToMavenLocal)
}

# ---------------------------------------------------------------------------
# Step 3: Gradle
#
# Resolves the kotlin-dsl compile classpath. The init script makes
# gradle-kotlin-maven-repo the only source of org.jetbrains.kotlin:2.4.10 and
# com.jetbrains.intellij.* artifacts, so a successful resolution proves they
# came from the locally built repository.
# ---------------------------------------------------------------------------
build_gradle() {
    # $1: GRADLE_USER_HOME to use
    (cd "$GRADLE_DIR" && \
        rm -f gradle/verification-metadata.xml && \
        GRADLE_USER_HOME="$GRADLE_GRADLE_HOME" \
        JAVA_HOME="$JDK17_HOME" \
        ./gradlew \
            -Dlocal.maven.repo="$KOTLIN_REPO" \
            -I "$INIT_SCRIPTS_DIR/local-repos-gradle.init.gradle.kts" \
            --refresh-dependencies \
            --no-configuration-cache \
            -Dorg.gradle.isolated-projects=false \
            -Pgradle_installPath="$GRADLE_DIST_DIR" \
            --no-daemon \
            install)
}


# ---------------------------------------------------------------------------
# Step 4: validation of the clean build
#
# 1. All required IntelliJ and Kotlin artifacts must exist in gradle-kotlin-maven-repo.
# 2. A clean Gradle user home must resolve Gradle's Kotlin dependencies from
#    gradle-kotlin-maven-repo (remote repositories are forbidden from serving them
#    by the init script, so a successful resolution proves the origin).
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
main() {
    local steps=("$@")
    [ "${#steps[@]}" -gt 0 ] || steps=(tools intellij kotlin gradle validate)

    local ran_tools=0
    for step in "${steps[@]}"; do
        case "$step" in
            tools)    install_tools; ran_tools=1 ;;
            intellij) prepare_dirs; build_intellij ;;
            kotlin)   prepare_dirs; build_kotlin ;;
            gradle)   prepare_dirs; build_gradle ;;
            *) echo "unknown step: $step (expected tools|intellij|kotlin|gradle|validate)" >&2; exit 2 ;;
        esac
    done
    [ "$ran_tools" -eq 1 ] || true
}

main "$@"
