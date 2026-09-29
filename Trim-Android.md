# Trim-Android: removing the unneeded `android/` tree from the IntelliJ platform build

## Goal

Produce the **same** platform maven artifacts (`com.jetbrains.intellij.*:251.27812.49`)
via `build.sh` while deleting ~3.18 GB (99%) of the 3.2 GB `intellij-community/android/`
directory.

## Background (verified against tag `idea/251.27812.49`)

`intellij-community` is a monorepo: `android/` holds the Android Studio plugin sources.
The platform build (`build.sh` → bazel → `OpenSourceCommunityInstallersBuildTarget`)
does not need them:

- **Bazel phase** (`bazel vendor` + `bazel build //build:i_build_target_deploy.jar`):
  zero android references. `MODULE.bazel` and `build/BUILD.bazel` never mention android;
  the target's transitive deps are only `//platform/build-scripts`, `//platform/util`,
  `//jps/model-api`, `//platform/build-scripts/downloader`, `@rules_jvm`, `@lib`.
  `BUILD.bazel` files under `android/` are never loaded.
- **Compile phase**: `.idea/modules.xml` lists ~289 android modules and
  `compileModules(moduleNames = null)` compiles **all** production targets
  (`buildDistributions` literally does `compileModules(null) // compile all`), so today
  every android module is compiled — and then discarded.
- **Artifact phase**: the `maven_artifacts` step publishes only platform-layout modules,
  **bundled** plugin modules, and `mavenArtifacts.additionalModules`. The only android
  artifacts ever produced are 7 `com.jetbrains.intellij.android:*` (gradle-dsl /
  declarative-lang family) — confirmed in `gradle-kotlin-maven-repo/com/jetbrains/intellij/android/`.

### JPS tolerates deletion (verified in JPS sources)

- Missing `.iml` files referenced from `.idea/modules.xml` are **silently skipped**:
  `JpsProjectLoader.loadModules` — `tryLoadRootElement` returns null on
  `NoSuchFileException` → logs `Module 'X' is skipped: ... doesn't exist` (info level).
- Dangling module dependencies (a kept module referencing a deleted module) are
  **ignored**: `JpsDependenciesEnumeratorBase` null-checks `depModule`.
- Test-scope deps on android modules (`intellij.gradle.tests`,
  `kotlin.gradle.gradle-java.k1`, kotlin multiplatform/jvm-debugger test modules) are
  irrelevant: test targets aren't compiled (`buildProduction`, includeTests=false) and
  those test modules have no production sources.

### The single hard failure point

`checkProductLayout` → `checkBaseLayout` iterates **all** `productLayout.pluginLayouts`,
which includes `CommunityRepositoryModules.androidPlugin(allPlatforms = true)`
(`build/src/org/jetbrains/intellij/build/IdeaCommunityProperties.kt:61`). Its ~40
`withModule("intellij.android.*")` entries are validated with `findRequiredModule` →
build aborts with "Cannot find required module" if android modules are gone.
→ **This one line must be patched out.**

## Which `android/` subdirectories are required (9 dirs, ~22 MB)

`IDEA_BUNDLED_PLUGINS` (`BaseIdeaProperties.kt`) directly contains
`intellij.android.gradle.dsl` and `intellij.android.gradle.declarative.lang.ide`, and the
bundled `intellij.gradle.dependencyUpdater` / `intellij.gradle.analysis` modules have
production-scope deps on the Gradle-DSL family:

| Keep | Reason |
|---|---|
| `android/gradle-dsl` | bundled plugin `android-gradle-dsl`; compile dep of gradle.dependencyUpdater/analysis |
| `android/gradle-dsl-flags` | module dep of gradle-dsl |
| `android/gradle-dsl-toml` | compile dep of gradle.analysis; runtime dep of dependencyUpdater |
| `android/gradle-dsl-kotlin` | runtime dep of dependencyUpdater |
| `android/gradle-dsl-declarative` | runtime dep of dependencyUpdater |
| `android/gradle-dsl-groovy` | runtime dep of dependencyUpdater |
| `android/gradle-declarative-lang` | dep of dsl-declarative and lang-ide |
| `android/gradle-declarative-lang-sync` | dep of lang-ide |
| `android/gradle-declarative-lang-ide` | bundled plugin `android-gradle-declarative-lang-ide` |

All 9 have self-contained content roots (`src`/`resources`/`gen` inside their own dirs)
and use only maven-resolved project libraries (`studio-platform`, `Guava`,
`kotlin-stdlib`, `commons-lang3`, `jetbrains-annotations`, `jsoup`,
`kotlinc.kotlin-compiler-common`) — **no** file references into the rest of `android/`.

Everything else (`android/android` (core), `adt-ui*`, `aswb`, `android-plugin`,
`android-kotlin`, profilers, prebuilt-consuming modules, …) is referenced only by
deleted modules or test-only modules → safe to remove.

## Implementation plan

### 1. Add `trim_android()` to `build.sh`

Called from `build_intellij()` right after the tag checkout, next to
`fix_intellij_lib_build_file` / `ensure_intellij_bazel_target`. Idempotent,
grep-guarded, unconditional (decision: always trim).

1. **Delete** every subdirectory of `intellij-community/android/` except the 9 above
   (keep top-level `LICENSE.txt`/`README.md`).
2. **Patch** `build/src/org/jetbrains/intellij/build/IdeaCommunityProperties.kt`:
   remove the line `CommunityRepositoryModules.androidPlugin(allPlatforms = true),`
   (idempotent: skip if already removed; fail loudly if the anchor is not found,
   mirroring existing patch helpers).
3. **Patch** `platform/build-scripts/src/org/jetbrains/intellij/build/CommunityRepositoryModules.kt`:
   remove the `androidDesignPlugin(),` entry from `COMMUNITY_REPOSITORY_PLUGINS` and
   drop the now-unused private `androidDesignPlugin()` helper. This plugin layout
   references deleted designer modules (compose-designer, layoutlib, nav.editor,
   etc.) and makes `checkProductLayout` fail with "modules from moduleJars aren't
   found in the project".
4. **Filter** android entries (`$PROJECT_DIR$/android/`) out of `.idea/modules.xml`
   (cosmetic; JPS would skip them anyway — keeps logs clean).
5. Leave untouched (all tolerated): `intellij.idea.community.main.android.iml`
   (empty module, dangling deps ignored), `.idea/compiler.xml` (per-module javac
   options for absent modules are unused), `.idea/libraries/*` (maven-resolved,
   still resolvable).

### 2. Clean stale build state

Remove `intellij-community/out/idea-ce` before the first trimmed run —
`incrementalCompilation=true` and stale JPS caches reference deleted modules.

### 3. Full rebuild + validation

1. Snapshot current artifact set:
   `find gradle-kotlin-maven-repo/com/jetbrains/intellij -type f | sort` → before.txt
2. `./build.sh intellij` (bazel vendor → bazel build deploy jar → JBR run, existing
   `INTELLIJ_SKIP_STEPS` unchanged).
3. `./build.sh validate` (checks all 17 platform + 5 java modules + kotlin artifacts).
4. **Parity check**: diff produced `maven-artifacts` against the snapshot — expect
   identical set, including the 7 `com.jetbrains.intellij.android:*` artifacts.

## Expected outcome

- Identical platform maven artifacts from ~1% of the original android source.
- `compile-all` skips ~290 android production modules → faster intellij step.
- `bazel vendor` closure unchanged (android was never in it).

## Rollback

```bash
git -C intellij-community checkout -- android .idea/modules.xml build/src platform/build-scripts/src/org/jetbrains/intellij/build/CommunityRepositoryModules.kt
rm -rf intellij-community/out/idea-ce
./build.sh intellij   # trim re-applies automatically; to disable, remove trim_android() call
```

## Risks / notes

- `intellij.gradle.dependencyUpdater`'s RUNTIME-scope deps (dsl-kotlin/groovy/
  declarative/toml) are covered by the keep-list (needed by pluginAuto layout discovery).
- `intellij.kotlin.gradle.multiplatformTests` has a production-scope dep on
  `intellij.android.plugin`, but it is a test-only module (no production sources) →
  dangling dep is ignored, production target is empty.
- If the intellij tag is bumped, re-verify: the keep-list is derived from
  `IDEA_BUNDLED_PLUGINS` and the gradle plugin modules' iml files at
  `idea/251.27812.49`; a newer tag may change these dependencies.
