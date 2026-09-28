# Plan: minimal build commands for Kotlin and IntelliJ IDEA (Gradle 9.8.0 bootstrap)

## Dependency chain (verified from sources)

```
gradle 9.8.0  --depends on-->  kotlin 2.4.10 artifacts  --depends on-->  intellij-community 251.27812.49 artifacts
```

- Gradle pins Kotlin **2.4.10** strictly (`!!`): `gradle/gradle/dependency-management/distribution.versions.toml` → `kotlin = "2.4.10!!"`.
- Kotlin pins the IntelliJ SDK in `kotlin/gradle/versions.properties` → `versions.intellijSdk=251.27812.49`.
- The mounted `intellij-community` repo contains tag **`idea/251.27812.49`** (currently checked out at `idea/2026.2.3`, so a checkout is required).

## Step 1 — IntelliJ IDEA: version and minimal build command

### Required version

**`251.27812.49`** — tag `idea/251.27812.49` in `intellij-community/`.

```bash
cd intellij-community && git checkout idea/251.27812.49
```

### Components the Kotlin build actually needs

Consumed as Maven artifacts `com.jetbrains.intellij.*:251.27812.49`
(see `kotlin/dependencies/intellij-core/build.gradle.kts` and
`kotlin/repo/gradle-build-conventions/buildsrc-compat/src/main/kotlin/intellijDependencies.kt`):

- `com.jetbrains.intellij.platform`: `util-rt`, `util-class-loader`, `util`, `util-base`,
  `util-xml-dom`, `core`, `core-impl`, `extensions`, `diagnostic`, `diagnostic-telemetry`,
  `util-progress`, `util-coroutines`, `jps-model`, `jps-model-impl`, `jps-model-serialization`,
  `util-jdom`, `analysis`
- `com.jetbrains.intellij.java`: `java-psi`, `java-psi-impl`, `java-frontback-psi`,
  `java-frontback-psi-impl`, `java-compiler-ant-tasks`

NOT needed for the compiler artifacts (only for the Kotlin IDEA plugin / tests):
`ideaIC` zip, `intellij-core` zip, `jps-standalone`, `jps-build-test`, `devkit-jps`,
`test-framework`, `resources`.

### Minimal build command

The only supported way to generate these Maven artifacts from the community repo is the
build-scripts installer target, which runs the `maven_artifacts` step
(`IdeaCommunityProperties` sets `mavenArtifacts.forIdeModules = true`):

```bash
cd intellij-community
./installers.cmd -Dintellij.build.skip.build.steps=sources_archive,search_index,broken_plugins_list,provided_modules_list,third_party_libraries,non_bundled_plugins,keymap_plugins,lib_url_check,localize,checksum_sign,mac_artifacts,mac_dmg,mac_sit,windows_artifacts,windows_zip_archive,windows_exe_installer,linux_artifacts,linux_tar_gz_without_jre,cross_platform_dist,os_specific_distributions,community_dist,repair_utility_bundle_step,doc_authoring_assets,fus_metadata_bundle_step,teamcity_artifacts_publication
```

- `installers.cmd` runs `bazel run //build:i_build_target` (`OpenSourceCommunityInstallersBuildTarget`); arguments are forwarded as JVM options.
- Signing steps are already skipped by the target itself.
- Keep `maven_artifacts` (and compilation) — everything else is skippable.
  The exact minimal skip-set must be validated during execution; if a skipped step breaks
  the pipeline, remove it from the list and retry.
- Output: `out/idea-ce/artifacts/maven-artifacts/` — a Maven repository with the
  `com.jetbrains.intellij.*` artifacts.

> Note: if network access to `https://www.jetbrains.com/intellij-repository/releases` is
> available, this step can be skipped entirely — the Kotlin build downloads these artifacts
> itself. Local build is only needed for offline/bootstrap builds.

### Make artifacts visible to the Kotlin build

The Kotlin build resolves `com.jetbrains.intellij.*` from the JetBrains intellij-repository.
For a local build, add the produced repo, e.g. via an init script:

```kotlin
// intellij-local.init.gradle.kts
allprojects {
    repositories {
        maven { url = uri("/work/kotlin-gradle-intellij/intellij-community/out/idea-ce/artifacts/maven-artifacts") }
    }
}
```

(Verify exact output path after the build; adjust accordingly.)

## Step 2 — Kotlin: minimal set of build tasks for Gradle's dependencies

### Artifacts Gradle 9.8.0 needs (verified)

From `distribution.versions.toml` (shipped in the distribution, used by
`platforms/core-configuration/kotlin-dsl` etc.) and `build.versions.toml`
(used by `build-logic*` to build Gradle itself):

| Maven artifact (`org.jetbrains.kotlin`) | Kotlin Gradle project |
|---|---|
| `kotlin-stdlib` | `:kotlin-stdlib` |
| `kotlin-reflect` | `:kotlin-reflect` |
| `kotlin-metadata-jvm` | `:kotlin-metadata-jvm` |
| `kotlin-script-runtime` | `:kotlin-script-runtime` |
| `kotlin-scripting-common` | `:kotlin-scripting-common` |
| `kotlin-scripting-jvm` | `:kotlin-scripting-jvm` |
| `kotlin-scripting-jvm-host` | `:kotlin-scripting-jvm-host` |
| `kotlin-scripting-compiler-embeddable` | `:kotlin-scripting-compiler-embeddable` |
| `kotlin-scripting-compiler-impl-embeddable` | `:kotlin-scripting-compiler-impl-embeddable` |
| `kotlin-compiler-embeddable` | `:kotlin-compiler-embeddable` |
| `kotlin-build-tools-api` | `:compiler:build-tools:kotlin-build-tools-api` |
| `kotlin-build-tools-impl` | `:compiler:build-tools:kotlin-build-tools-impl` |
| `kotlin-gradle-plugin-api` | `:kotlin-gradle-plugin-api` |
| `kotlin-gradle-plugin` | `:kotlin-gradle-plugin` |
| `kotlin-sam-with-receiver` | `:kotlin-sam-with-receiver` |
| `kotlin-sam-with-receiver-compiler-plugin` | `:kotlin-sam-with-receiver-compiler-plugin` |
| `kotlin-sam-with-receiver-compiler-plugin-embeddable` | `:kotlin-sam-with-receiver-compiler-plugin.embeddable` |
| `kotlin-assignment` | `:kotlin-assignment` |
| `kotlin-assignment-compiler-plugin-embeddable` | `:kotlin-assignment-compiler-plugin.embeddable` |
| `jvm-abi-gen-embeddable` | `:plugins:jvm-abi-gen-embeddable` |

(Project paths verified in `kotlin/settings.gradle.kts`; embeddable artifactIds verified in
`plugins/assign-plugin/assign-plugin.embeddable/build.gradle.kts` and
`plugins/sam-with-receiver/sam-with-receiver.embeddable/build.gradle.kts` —
`artifactId.replace(".", "-")`.)

### Minimal build command

All these projects apply `maven-publish` (via `KotlinBuildPublishingPlugin`), and the repo
is tagged `build-2.4.10-380`. Version must be exactly `2.4.10` (Gradle pins `2.4.10!!`);
`-Pbuild.number=2.4.10` makes `kotlinVersion = 2.4.10` (see `kotlin/build.gradle.kts`).

```bash
cd kotlin
./gradlew -Pbuild.number=2.4.10 \
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
  :plugins:jvm-abi-gen-embeddable:publishToMavenLocal
```

Notes:

- Transitive project dependencies (e.g. `:kotlin-daemon-embeddable`, `:kotlin-build-common`,
  compiler modules) are built automatically by task dependencies; if any of them also needs
  to be resolvable by Gradle as an external module, add its `publishToMavenLocal` task
  (discover via failures in the Gradle build).
- Fallback (non-minimal but simpler): `./gradlew -Pbuild.number=2.4.10 install` —
  installs **all** public artifacts to the local Maven repo (see `kotlin/ReadMe.md`).
- For offline runs, point `GRADLE_USER_HOME` at the provided cache:
  `export GRADLE_USER_HOME=/work/kotlin-gradle-intellij/.gradle`.

## Step 3 — Verification

1. After Step 1: `out/idea-ce/artifacts/maven-artifacts/com/jetbrains/intellij/platform/core/251.27812.49/` exists.
2. After Step 2: for every artifact in the table,
   `~/.m2/repository/org/jetbrains/kotlin/<artifact>/2.4.10/` exists.
3. Gradle build resolves Kotlin: run `./gradlew :platforms:core-configuration:kotlin-dsl:dependencies --configuration compileClasspath`
   in `gradle/` and confirm all `org.jetbrains.kotlin:*:2.4.10` resolve from the local repo
   (Gradle build must have `mavenLocal()` enabled or an init script adding it).

## Open risks / assumptions

- The exact minimal `intellij.build.skip.build.steps` set is to be validated empirically;
  the safe fallback is plain `./installers.cmd`.
- Kotlin build may require additional IntelliJ artifacts at configuration time for
  IDE-related projects; if configuration fails on a missing `com.jetbrains.intellij.*`
  artifact, add it to the required list (it is produced by the same `maven_artifacts` step).
- `intellij-community` is currently checked out at `idea/2026.2.3`; building requires
  switching to `idea/251.27812.49` (or confirming that the Kotlin build accepts the newer
  version by overriding `versions.intellijSdk`, which is riskier).
