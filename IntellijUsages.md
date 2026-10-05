## Final subagent summary

All 28 artifact-investigation tasks were run. Each subagent searched `build.gradle(.kts)`, `settings.gradle(.kts)`, `pom.xml`, `libs.versions.toml`, lockfiles, Bazel `BUILD.bazel`/`MODULE.bazel`, and source imports across:

- `/work/kotlin-gradle-intellij/kotlin`
- `/work/kotlin-gradle-intellij/gradle-gradle`
- `/work/kotlin-gradle-intellij/gradle-kotlin`
- `/work/kotlin-gradle-intellij/intellij-community`
- `/work/kotlin-gradle-intellij/gradle-dist`

Verdicts below are for **producing the downstream Kotlin and Gradle builds** (i.e., whether the artifact/version enters the Kotlin/Gradle dependency graph or is only needed inside the upstream `intellij-community` IDE build).

---

### ✅ Absolutely needed for downstream Kotlin/Gradle builds

| Task | Artifact | Version | Why it is needed | Key evidence |
|---|---|---|---|---|
| `com.auth0` | `java-jwt` | `4.3.0` | Transitive runtime of Apple notarization client used by `intellij-community/platform/build-scripts`; consumed downstream | `intellij-community/lib/MODULE.bazel:10640`, `platform/build-scripts/src/.../notarize.kt:53` |
| `com.dynatrace.hash4j` | `hash4j` | `0.20.0` | Direct in `intellij-community` JPS/util modules; transitive into Kotlin JPS artifacts via `jps-build` | `intellij-community/lib/MODULE.bazel:2490`, `intellij-repo/.../core-ui-251.27812.49.pom`, `kotlin/jps/jps-plugin/build.gradle.kts:34,71` |
| `com.github.ben-manes.caffeine` | `caffeine` | `3.2.0` | `intellij-community` pins 3.2.0 and source imports `com.github.benmanes.caffeine.cache.*` | `intellij-community/lib/MODULE.bazel:691`, `jps/jps-builders/src/.../Containers.java`, `platform/indexing-impl/.../storageCacheProviders.kt` |
| `com.google.flatbuffers` | `flatbuffers-java` | `25.2.10` | Transitive runtime of `arrow-vector` in `intellij-community/build/jvm-rules` | `intellij-community/build/jvm-rules/libs.yaml:31`, `BUILD.bazel:154`, `state/arrow.kt` |
| `com.google.guava` | `failureaccess` | `1.0.2` | Directly pinned/embedded by Kotlin and `intellij-community` | `kotlin/gradle/libs.versions.toml:7,112`, `kotlin/libraries/tools/kotlin-gradle-plugin/build.gradle.kts:122`, `intellij-community/lib/MODULE.bazel:2427` |
| `com.google.guava` | `guava` | `33.4.0-jre` | `intellij-community` pins this version; Kotlin/Gradle use different versions but need the Guava family | `intellij-community/lib/MODULE.bazel:2420`, `lib/BUILD.bazel:1846`; Kotlin uses `33.3.1-jre`, Gradle dist uses `33.4.6-jre` |
| `com.h2database` | `h2-mvstore` | `2.3.232` | Transitive runtime of `intellij-community` JPS/util-ex artifacts consumed by Kotlin JPS plugin | `intellij-community/lib/MODULE.bazel:9735`, `intellij-repo/.../jps-build-251.27812.49.pom`, `kotlin/jps/jps-plugin/build.gradle.kts:34` |
| `com.jetbrains.format-ripper` | `format-ripper` | `1.1.1` | Direct compile dep of `intellij-community/platform/build-scripts`; source imports `com.jetbrains.signatureverifier.*` | `intellij-community/lib/MODULE.bazel:10660`, `platform/build-scripts/BUILD.bazel:64`, `sign.kt` |
| `com.networknt` | `json-schema-validator` | `1.3.1` | Direct compile dep of `intellij-community/platform/build-scripts`; source imports `com.networknt.schema.*` | `intellij-community/lib/MODULE.bazel:4176`, `platform/build-scripts/BUILD.bazel:48`, `ProductInfoValidator.kt` |
| `com.squareup.okio` | `okio-jvm` | `3.9.0` | Transitive runtime of okhttp/apollo in `intellij-community` | `intellij-community/lib/MODULE.bazel:10274`, `lib/BUILD.bazel:7254`, `download.kt` |
| `com.sun.activation` | `jakarta.activation` | `1.2.2` | JAXB 2.3.x runtime requirement in `intellij-community`; Debian 2.0.0 has wrong namespace | `intellij-community/lib/MODULE.bazel:3295`, `.idea/libraries/jaxb_runtime.xml`, `PlatformModules.kt:184-189` |
| `io.opentelemetry` | `opentelemetry-api` | `1.47.0` | Direct in `intellij-community`; transitive via published IntelliJ artifacts consumed by Kotlin | `intellij-community/lib/MODULE.bazel:10295`, `intellij-repo/.../core-impl-251.27812.49.pom`, Kotlin `KotlinOpenTelemetryProvider.kt` |
| `io.opentelemetry` | `opentelemetry-context` | `1.47.0` | Required at runtime by `opentelemetry-api:1.47.0`; imported in `intellij-community` | `intellij-community/lib/MODULE.bazel:10302`, `fleet/rpc/.../RpcStream.kt`, `platform-impl/.../Utils.kt` |
| `javax.annotation` | `javax.annotation-api` | `1.3.2` | JSR-250 annotations used by generated code in `intellij-community`; also in Kotlin kapt test fixtures | `intellij-community/lib/MODULE.bazel:3233`, `jps/.../JavacRemoteProto.java`, Kotlin kapt fixtures |
| `org.apache.arrow` | `arrow-format` | `18.2.0` | Transitive runtime of `arrow-vector` in `intellij-community/build/jvm-rules` | `intellij-community/build/jvm-rules/BUILD.bazel:155`, `MODULE.bazel:211` |
| `org.apache.arrow` | `arrow-memory-core` | `18.2.0` | Direct compile dep of JPS builder worker; imported for `RootAllocator` | `intellij-community/build/jvm-rules/src/jps-builder/BUILD.bazel:27`, `state/arrow.kt` |
| `org.apache.arrow` | `arrow-memory-netty` | `18.2.0` | Direct compile dep of JPS builder worker | `intellij-community/build/jvm-rules/src/jps-builder/BUILD.bazel:26`, `BUILD.bazel:172` |
| `org.apache.arrow` | `arrow-memory-netty-buffer-patch` | `18.2.0` | Transitive runtime of `arrow-memory-netty` | `intellij-community/build/jvm-rules/BUILD.bazel:177` |
| `org.apache.arrow` | `arrow-vector` | `18.2.0` | Direct compile dep; heavily imported for Arrow build-state storage | `intellij-community/build/jvm-rules/src/jps-builder/BUILD.bazel:25`, `state/BuildStateStorage.kt`, `state/arrow.kt` |
| `org.codehaus.groovy` | `groovy` | `3.0.19` | `intellij-community` pins 3.0.19 and bundles into `groovy.jar`; downstream Kotlin consumes IntelliJ SDK | `intellij-community/lib/MODULE.bazel:10353`, `platform/build-scripts/.../PlatformModules.kt:191-200`, `KotlinPluginBuildTarget` |
| `org.jetbrains.intellij.plugins` | `structure-base` | `3.276` | Direct dep of `intellij-community/platform/build-scripts` via `intellij-plugin-structure` | `intellij-community/lib/MODULE.bazel:2616`, `lib/BUILD.bazel:1971`, `platform/build-scripts/BUILD.bazel:72` |
| `org.jetbrains.intellij.plugins` | `structure-intellij` | `3.276` | Direct dep of `intellij-community/platform/build-scripts` | `intellij-community/lib/MODULE.bazel:2609`, `JetBrainsProductProperties.kt`, `DistributionJARsBuilder.kt` |

---

### ❌ NOT needed for downstream Kotlin/Gradle builds

| Task | Artifact | Version | Why not needed |
|---|---|---|---|
| `com.amazon.ion` | `ion-java` | `1.11.9` | Only used inside `intellij-community/platform/object-serializer`; Kotlin’s `jps-plugin` pulls `object-serializer` with `isTransitive = false` |
| `com.fasterxml.jackson.module` | `jackson-module-kotlin` | `2.17.2` | Kotlin uses `2.21.1`; `2.17.2` is only for `intellij-community` |
| `com.github.spullara.cli-parser` | `cli-parser` | `1.1.6` | Only used in `intellij-community` IDE/JPS tools (`platform/inspect`, `jps/standalone-builder`) |
| `com.google.j2objc` | `j2objc-annotations` | `3.0.0` | Guava transitive with no source usage; Kotlin/Gradle builds exclude it |
| `com.google.protobuf` | `protobuf-java` | `4.29.3` | Only used in `intellij-community/build/jvm-rules`; Kotlin/Gradle use 4.28.2/3.24.4/2.6.1-2 |
| `com.intellij.platform` | `kotlinx-coroutines-core-jvm` | `1.8.0-intellij-12` | Kotlin/Gradle use standard `org.jetbrains.kotlinx` coroutines (1.8.0–1.10.2) |
| `com.intellij.platform` | `kotlinx-coroutines-debug` | `1.8.0-intellij-12` | Same as above |
| `com.intellij.platform` | `kotlinx-coroutines-slf4j` | `1.8.0-intellij-12` | Same as above |
| `com.jetbrains` | `jbr-api` | `1.2.0` | Declared in `intellij-community` but no source imports/usages |
| `com.jetbrains.intellij.devkit` | `devkit-runtime-module-repository-jps` | `251.16369` | Only used by `intellij-community` internal build-scripts tooling |
| `com.squareup.okhttp3` | `okhttp` | `5.0.0-alpha.14` | Source code uses OkHttp 4.x APIs; the alpha pin is not required. Debian 3.13.1 is insufficient, but 4.12.0 would satisfy |
| `io.opentelemetry` | `opentelemetry-extension-kotlin` | `1.47.0` | Only used in `intellij-community` build/tool modules; not in consumed published artifacts |
| `org.apache.arrow` | `arrow-algorithm` | `18.2.0` | Declared as compile dep but no source imports; Maven POM shows `arrow-vector` does not depend on it |
| `org.atteo` | `evo-inflector` | `1.3` | Only bundled inside `intellij-community` `intellij-plugin-structure` Bazel target; no Kotlin/Gradle usage |
| `org.jetbrains.jps` | `jps-javac-extension` | `10` | Only needed by `intellij-community`; Kotlin only filters version `7` |
| `org.jetbrains.teamcity` | `serviceMessages` | `2024.07` | Kotlin pins and embeds `2019.1.4` independently; Gradle does not use it |
| `org.jetbrains.testDiscovery` | `test-discovery-plugin-base` | `0.1.191` | Runtime-only library with no source usage; not part of published IntelliJ artifacts consumed downstream |

---

### ⚠️ Important caveats

1. **Scope matters.** An artifact marked “NOT needed” here is still required to *build `intellij-community` itself*. The verdicts above only answer whether it is needed for the downstream Kotlin/Gradle builds in this workspace.
2. **Guava version mismatch.** `intellij-community` needs `33.4.0-jre`, Kotlin needs `33.3.1-jre`, and the Gradle distribution ships `33.4.6-jre`. Packaging only `33.4.0-jre` will not satisfy Kotlin or Gradle.
3. **OkHttp version mismatch.** The build does not actually require the alpha `5.0.0-alpha.14`; OkHttp `4.12.0` satisfies the source. However, Debian’s `3.13.1` is too old because the code uses `RequestBody.Companion.asRequestBody/toRequestBody` and `MediaType.Companion.toMediaType`.
4. **Jakarta Activation namespace.** `com.sun.activation:jakarta.activation:1.2.2` is the `javax.activation`-compatible transitional artifact. Debian’s `2.0.0` uses the `jakarta.activation` namespace and is incompatible with the JAXB 2.3.x stack used here.
5. **Arrow scope.** The needed Arrow artifacts are confined to `intellij-community/build/jvm-rules` (the Bazel-based JPS builder), not to Gradle-based Kotlin/Gradle builds.

The subagent investigations are complete.