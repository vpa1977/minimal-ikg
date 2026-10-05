# ProGuard dependency in `@kotlin` — investigation and removal plan

## 1. Current state

The Kotlin repository pulls in `com.guardsquare:proguard-gradle:7.4.2` **only** in the included `buildsrc-compat` build:

- declared in `kotlin/gradle/libs.versions.toml` (lines 15, 89)
- added to the classpath in
  `kotlin/repo/gradle-build-conventions/buildsrc-compat/build.gradle.kts` line 98

No plugin id (`com.guardsquare.proguard`) is applied; the code uses `proguard.gradle.ProGuardTask` directly via a small wrapper.

### 1.1 What ProGuard is actually doing today

`KotlinBuildProperties.proguard` is **false by default** locally and **true on TeamCity**:

```kotlin
// repo/gradle-build-conventions/utilities/src/main/kotlin/BuildPropertiesExt.kt:16
val KotlinBuildProperties.proguard: Boolean get() =
    postProcessing && booleanProperty("kotlin.build.proguard", isTeamcityBuild).get()
```

So ProGuard only runs on CI builds. In local builds the final artifacts are already produced from the Shadow/relocated jar.

#### Active shrink tasks (only on TeamCity)

| Module | Task | `.pro` config | Output used when `proguard=true` |
|---|---|---|---|
| `:kotlin-reflect` | `CacheableProguardTask` (reflect/build.gradle.kts:206) | `core/reflection.jvm/reflection.pro` | proguarded jar |
| `:kotlin-main-kts` | `CacheableProguardTask` (build.gradle.kts:80) | `libraries/tools/kotlin-main-kts/main-kts.pro` | after-proguard jar |
| `:kotlin-scripting-dependencies-maven-all` | `CacheableProguardTask` (build.gradle.kts:125) | `dependencies-maven.pro` | after-proguard jar |
| `:kotlinx-metadata-jvm` | `CacheableProguardTask` (build.gradle.kts:61) | `metadata.pro` | proguard jar |

#### Validation task

- `:native:swift:swift-export-embeddable` uses `validateEmbeddedJarClasspathUsingProguard` (build.gradle.kts:82) to verify that the embedded jar only references classes present on the runtime classpath.

#### Supporting code

| File | ProGuard usage |
|---|---|
| `repo/gradle-build-conventions/buildsrc-compat/src/main/kotlin/CacheableProguradTask.kt` | wraps `proguard.gradle.ProGuardTask` |
| `repo/gradle-build-conventions/buildsrc-compat/src/main/kotlin/CommonUtil.kt:18,70` | branch for `ProGuardTask` in `Task.singleOutputFile` |
| `repo/gradle-build-conventions/buildsrc-compat/src/main/kotlin/build-time-report.gradle.kts:21,41,88` | class lookup/task-category handling |
| `repo/gradle-build-conventions/buildsrc-compat/src/main/kotlin/jarEmbedding.kt:53-94` | `validateEmbeddedJarClasspathUsingProguard` helper |

#### Leftovers from earlier ProGuard usage

- `prepare/compiler/build.gradle.kts:48,87` still names a classifier `before-proguard`, but `:kotlin-compiler` itself no longer runs ProGuard.
- `prepare/compiler/compiler.pro` is unused.
- `libraries/tools/klib-abi-reader/build.gradle.kts:33` uses classifier `before-proguard` and `klib-abi-reader.pro` exists, but no ProGuard task is configured.
- `repo/gradle-build-conventions/buildsrc-compat/src/main/kotlin/common-configuration.gradle.kts:477-482` keeps a `skipJvmDefaultForModule` workaround for `:core:descriptors` (KT-54749) that was needed because the proguarded `kotlin-reflect` jar exposed package-private symbols.
- `libraries/tools/jdk-api-validator/src/test/JdkApiUsageTest.kt:21` explicitly uses the `shadow` classifier because the final `kotlin-reflect` jar was ProGuard-shrunk.

## 2. Goal

Remove the direct `com.guardsquare:proguard-gradle` dependency from the Kotlin build, stop shrinking artifacts with ProGuard, and clean up the associated build logic and documentation.

## 3. Removal plan

Execute each Phase as a separate subagent to minimize context.
Pass overall plan and the current phase.
Commit final result after validation passes with the removal plan and changes summary.

### Phase 0 — Decide on two points

1. **Classpath validation in `swift-export-embeddable`**
    drop `validateEmbeddedJarClasspathUsingProguard`. Rely on the existing `validateNoDuplicatesInRuntimeClasspath` and integration tests.
2. **`interopWithProguarded` KGP integration test**
   - It exists only to verify KGP works against ProGuard-shrunk libraries. Since the project itself will no longer ship ProGuard-shrunk jars, the test can be deleted or rewritten to use a different shrinking/obfuscation tool.

### Phase 1 — Stop using ProGuard for artifact shrink

For each module below, make the *result jar* always use the Shadow/relocated jar directly and delete the ProGuard task, the supporting configurations, and the `.pro` file.

#### `:kotlin-reflect` (`libraries/reflect/build.gradle.kts:206-228`)

- Remove `val proguard by task<CacheableProguardTask> { ... }`.
- Remove `val proguardDeps` and `val proguardAdditionalInJars` configurations.
- In the `intermediate` selector (line 287-290) keep only:

```kotlin
val intermediate = when {
    kotlinBuildProperties.relocation -> stripMetadata
    else -> reflectShadowJar
}
```

- Delete `core/reflection.jvm/reflection.pro`.

#### `:kotlin-main-kts` (`libraries/tools/kotlin-main-kts/build.gradle.kts:80-112`)

- Remove `val proguard by task<CacheableProguardTask> { ... }`.
- Remove `val proguardLibraryJars` configuration.
- In `resultJar` (line 114-121) always use `relocatedJar`.
- Rename `archiveClassifier.set("before-proguard")` on `relocatedJar` to e.g. `"shadow"`.
- Delete `libraries/tools/kotlin-main-kts/main-kts.pro`.

#### `:kotlin-scripting-dependencies-maven-all` (`libraries/scripting/dependencies-maven-all/build.gradle.kts:125-157`)

- Remove `val proguard by task<CacheableProguardTask> { ... }`.
- Remove `val proguardLibraryJars` configuration and associated dependencies.
- In `resultJar` (line 159-166) always use `normalizedJar`.
- Rename `testProguardedApiWithDefaultValues` to `testApiWithDefaultValues` and update the comment.
- Delete `libraries/scripting/dependencies-maven-all/dependencies-maven.pro`.

#### `:kotlinx-metadata-jvm` (`libraries/kotlinx-metadata/jvm/build.gradle.kts:61-83`)

- Remove `val proguard by task<CacheableProguardTask> { ... }`.
- Remove `val proguardLibraryJars` configuration.
- In `resultJar` (line 85-96) always use `relocatedJar`.
- Delete `libraries/kotlinx-metadata/jvm/metadata.pro`.

### Phase 2 — Remove the buildSrc support code

1. **Remove the dependency** from
   `repo/gradle-build-conventions/buildsrc-compat/build.gradle.kts:98`

   ```kotlin
   // delete:
   implementation(libs.proguard.gradlePlugin)
   ```

2. **Delete**
   `repo/gradle-build-conventions/buildsrc-compat/src/main/kotlin/CacheableProguradTask.kt`

3. **Clean `CommonUtil.kt`**
   - Remove `import proguard.gradle.ProGuardTask`
   - Remove the `is ProGuardTask -> ...` branch in `Task.singleOutputFile`.

4. **Clean `build-time-report.gradle.kts`**
   - Remove `proguardClass` from `BuildTimeReporter` constructor.
   - Remove `findClass("proguard.gradle.ProGuardTask") ?: return` and the related `proguardClass.isInstance(task)` branch in `taskCategory`.

5. **Clean `jarEmbedding.kt`**
   - Remove `validateEmbeddedJarClasspathUsingProguard` and the `swift-export-embeddable.pro` file if Option A from Phase 0 is chosen.

### Phase 3 — Remove build flags and reporting

1. **Remove the property** from
   `repo/gradle-build-conventions/utilities/src/main/kotlin/BuildPropertiesExt.kt:16`

   ```kotlin
   // delete:
   val KotlinBuildProperties.proguard: Boolean get() = ...
   ```

2. **Update the root build log** in `kotlin/build.gradle.kts:715-719`
   - Remove `proguardMessage` and stop printing it.

3. **Update `kotlin/ReadMe.md:88`**
   - Change the sentence about TeamCity/local ProGuard behavior.

### Phase 4 — Clean historical leftovers

1. **`prepare/compiler`**
   - Rename `archiveClassifier.set("before-proguard")` in `prepare/compiler/build.gradle.kts:87` to e.g. `"unshrunk"`.
   - Remove the stale comment mentioning ProGuard on line 48.
   - Delete `prepare/compiler/compiler.pro` unless it is retained for documentation.

2. **`klib-abi-reader`**
   - Rename `archiveClassifier.set("before-proguard")` in `libraries/tools/klib-abi-reader/build.gradle.kts:33`.
   - Delete `libraries/tools/klib-abi-reader/klib-abi-reader.pro`.

3. **Remove ProGuard workaround for `:core:descriptors`**
   - In `repo/gradle-build-conventions/buildsrc-compat/src/main/kotlin/common-configuration.gradle.kts:477-482`, remove the `:core:descriptors` exception from `skipJvmDefaultForModule`.
   - Re-run `:core:descriptors` tests and the affected reflection tests; if KT-54749 does not reproduce, the workaround can stay removed.

4. **`JdkApiUsageTest`**
   - In `libraries/tools/jdk-api-validator/src/test/JdkApiUsageTest.kt:18-25`, remove the `// Do not use the final jar artifact. It's shrunk by proguard.` comment and use the final artifact instead of the `shadow` classifier.

5. **`Summary.md`**
   - Update or remove the ProGuard row in the artifact-producing plugins table (line 276) and the `proguardLibraries` row (line 303).

### Phase 5 — Version catalog

In `kotlin/gradle/libs.versions.toml`:

- Remove line 15: `proguard = "7.4.2"`
- Remove line 89: `proguard-gradlePlugin = { module = "com.guardsquare:proguard-gradle", version.ref = "proguard" }`

### Phase 6 — Optional integration-test cleanup

If the decision from Phase 0 is to remove `interopWithProguarded`:

- Delete the whole directory
  `libraries/tools/kotlin-gradle-plugin-integration-tests/src/test/resources/testProject/interopWithProguarded`
- Remove `testInteropWithProguarded` and the `@TestMetadata("interopWithProguarded")` references in
  `libraries/tools/kotlin-gradle-plugin-integration-tests/src/test/kotlin/org/jetbrains/kotlin/gradle/SimpleKotlinGradleIT.kt`.

## 5. Risks and mitigation

| Risk | Impact | Mitigation |
|---|---|---|
| **KT-54749 regression** | Removing the `:core:descriptors` JVM-default workaround may re-expose the issue once `kotlin-reflect` is no longer shrunk. | Run `:core:descriptors` tests and reflection-heavy tests after removing the workaround. Re-add only if it fails. |
| **Build logic references** | Any missed import of `proguard.gradle.ProGuardTask` or `CacheableProguardTask` will fail compilation. | The search list above covers all occurrences; a follow-up full-text search for `proguard`/`ProGuardTask`/`CacheableProguardTask` should return zero hits. |

## 6. Suggested verification commands

```bash
# Assemble the modules that used to be proguarded
./gradlew :kotlin-reflect:assemble \
           :kotlin-main-kts:assemble \
           :kotlin-scripting-dependencies-maven-all:assemble \
           :kotlinx-metadata-jvm:assemble

# Compare TeamCity-size artifacts
./gradlew :kotlin-reflect:assemble :kotlin-main-kts:assemble \
          -Pteamcity=true

# Core/reflection tests
./gradlew :core:descriptors:test :kotlin-reflect:test coreLibsTest

# Native Swift export integration tests
./gradlew :native:swift:swift-export-embeddable:testSwiftExportStandaloneWithEmbeddable \
          -Pkotlin.native.enabled=true -Pteamcity=true

# KGP integration tests (if interopWithProguarded is kept)
./gradlew :kotlin-gradle-plugin-integration-tests:kgpJvmTests \
          --tests "*InteropWithProguarded*"
```

Final verification, run in the workspace directory:

```
./build.sh kotlin
```

## 7. Open decisions before implementation

1. Should `swift-export-embeddable` keep a classpath-validation task, or is removing ProGuard-based validation acceptable?
2. Should the `interopWithProguarded` KGP integration test be deleted, rewritten with a different tool, or kept as-is?
3. Does the project want to keep `prepare/compiler/compiler.pro` for reference, or delete it now?

If you confirm those decisions, the next step is a code-writing agent implementing the phases above.