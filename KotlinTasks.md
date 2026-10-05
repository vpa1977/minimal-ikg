Create stories for this epic

### Upload to archive `kotlinx-coroutines` artifacts
- **Group:** `com.intellij.platform`
- **Artifacts:** `kotlinx-coroutines-core-jvm`, `kotlinx-coroutines-debug`
- **Upstream URL:** https://github.com/Kotlin/kotlinx.coroutines (JetBrains IntelliJ fork)
- **Build system:** Gradle

### Upload to archive `com.gradleup.shadow` artifacts
- **Group:** `com.gradleup.shadow`
- **Artifact:** `shadow-gradle-plugin`
- **Upstream URL:** https://github.com/GradleUp/shadow
- **Build system:** Gradle

### Package (Upgrade) `com.squareup.kotlinpoet-jvm` artifacts
- **Group:** `com.squareup`
- **Artifact:** `kotlinpoet-jvm`
- **Upstream URL:** https://github.com/square/kotlinpoet
- **Build system:** Gradle

### Package (Upgrade) `gradle.plugin.org.gradle.crypto` artifacts
- **Group:** `gradle.plugin.org.gradle.crypto`
- **Artifact:** `checksum`
- **Upstream URL:** https://github.com/gradle/gradle-checksum
- **Build system:** Gradle

### Package (Upgrade) `io.ktor` artifacts
- **Group:** `io.ktor`
- **Artifacts:** `ktor-client-cio-jvm`, `ktor-client-core-jvm`, `ktor-events-jvm`, `ktor-http-cio-jvm`, `ktor-http-jvm`, `ktor-io-jvm`, `ktor-network-jvm`, `ktor-network-tls-jvm`, `ktor-serialization-jvm`, `ktor-sse-jvm`, `ktor-utils-jvm`, `ktor-websocket-serialization-jvm`, `ktor-websockets-jvm`
- **Upstream URL:** https://github.com/ktorio/ktor
- **Build system:** Gradle

### Package (Upgrade) `io.opentelemetry` artifacts
- **Group:** `io.opentelemetry`
- **Artifacts:** `opentelemetry-api`, `opentelemetry-context`
- **Upstream URL:** https://github.com/open-telemetry/opentelemetry-java
- **Build system:** Gradle

### Package (Upgrade) `org.apache.groovy` (4.0) artifacts
- **Group:** `org.apache.groovy`
- **Artifact:** `groovy`
- **Upstream URL:** https://github.com/apache/groovy
- **Build system:** Gradle

### Package (Upgrade) `com.google.guava` artifacts
- **Group:** `com.google.guava`
- **Artifacts:** `failureaccess`, `listenablefuture`
- **Upstream URL:** https://github.com/google/guava
- **Build system:** Maven

### Package (Upgrade) `com.google.j2objc` artifacts
- **Group:** `com.google.j2objc`
- **Artifact:** `j2objc-annotations`
- **Upstream URL:** https://github.com/google/j2objc
- **Build system:** Maven (annotations module; repo also uses Bazel/Make)

### Package (Upgrade) `com.google.protobuf` artifacts
- **Group:** `com.google.protobuf`
- **Artifacts:** `protobuf-java`, `protobuf-kotlin`
- **Upstream URL:** https://github.com/protocolbuffers/protobuf
- **Build system:** Bazel (Java artifacts published via Maven)


### Skip `org.jetbrains` `annotations-java5`
- **Group:** `org.jetbrains`
- **Artifact:** `annotations-java5`
- **Upstream URL:** https://github.com/JetBrains/java-annotations
- **Build system:** Gradle

### Repackage kotlin vendored b-d
- **Group:** `org.jetbrains.intellij.deps`
  - **Artifacts:** `asm-all`, `gradle-api`, `jdom`, `log4j`
  - **Upstream URLs:**
    - `asm-all`: https://github.com/JetBrains/intellij-deps-asm
    - `gradle-api`: https://github.com/gradle/gradle (repackaged)
    - `jdom`: https://github.com/JetBrains/intellij-deps-jdom
    - `log4j`: https://github.com/JetBrains/intellij-deps-log4j
  - **Build systems:** Gradle (`asm-all`, `gradle-api`), Ant (`jdom`, `log4j`)
- **Group:** `org.jetbrains.intellij.deps.fastutil`
  - **Artifact:** `intellij-deps-fastutil`
  - **Upstream URL:** https://github.com/JetBrains/intellij-deps-fastutil
  - **Build system:** Maven
- **Group:** `org.jetbrains.intellij.deps.jna`
  - **Artifacts:** `jna`, `jna-platform`
  - **Upstream URL:** https://github.com/java-native-access/jna
  - **Build system:** Ant (upstream; repackaging JetBrains-internal)

### Disable `com.github.gundy` artifacts
- **Group:** `com.github.gundy`
- **Artifact:** `semver4j`
- **Upstream URL:** https://github.com/gundy/semver4j
- **Build system:** Maven

### Disable `org.spdx` artifacts
- **Group:** `org.spdx`
- **Artifacts:** `java-spdx-library`, `spdx-gradle-plugin`, `spdx-jackson-store`
- **Upstream URLs:**
  - `java-spdx-library`: https://github.com/spdx/Spdx-Java-Library
  - `spdx-gradle-plugin`: https://github.com/spdx/spdx-gradle-plugin
  - `spdx-jackson-store`: https://github.com/spdx/spdx-java-jackson-store
- **Build systems:** Maven (`java-spdx-library`, `spdx-jackson-store`), Gradle (`spdx-gradle-plugin`)

### Disable `com.jgoodies` artifacts
- **Group:** `com.jgoodies`
- **Artifact:** `forms`
- **Upstream URL:** https://www.jgoodies.com/freeware/libraries/forms/
- **Build system:** Unknown

### Disable `com.gradle.publish` artifacts
- **Group:** `com.gradle.publish`
- **Artifact:** `plugin-publish-plugin`
- **Upstream URL:** https://plugins.gradle.org/plugin/com.gradle.plugin-publish
- **Build system:** Gradle

