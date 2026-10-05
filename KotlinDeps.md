| group | artifact id | Kotlin Version | Debian Versions | Summary | Upstream | Build |
|-------|-------------|----------------|-----------------|---------|----------|-------|


Already packaged in ppa:
| com.intellij.platform | kotlinx-coroutines-core-jvm | 1.8.0-intellij-13 | -> has bootstrap | JetBrains IntelliJ-fork rebuild of kotlinx-coroutines-core | https://github.com/Kotlin/kotlinx.coroutines (fork) | Gradle |
| com.intellij.platform | kotlinx-coroutines-debug | 1.8.0-intellij-13 | -> has bootstrap | JetBrains IntelliJ-fork rebuild of kotlinx-coroutines-debug | https://github.com/Kotlin/kotlinx.coroutines (fork) | Gradle |
| com.gradleup.shadow | shadow-gradle-plugin | 9.3.2 | -> has bootstrap | Fat/uber-JAR plugin; GradleUp community continuation of the classic Shadow plugin | https://github.com/GradleUp/shadow | Gradle |


Package:
| com.squareup | kotlinpoet-jvm | 2.2.0 |  | Kotlin API for programmatically generating .kt source files | https://github.com/square/kotlinpoet | Gradle |
| gradle.plugin.org.gradle.crypto | checksum | 1.4.0 |  | Small Gradle plugin to create file checksums (unmaintained since 2022) | https://github.com/gradle/gradle-checksum | Gradle |
| io.ktor | ktor-client-cio-jvm | 3.1.3 |  | Kotlin multiplatform async HTTP client (CIO engine) | https://github.com/ktorio/ktor | Gradle |
| io.ktor | ktor-client-core-jvm | 3.1.3 |  | Kotlin multiplatform async HTTP client core | https://github.com/ktorio/ktor | Gradle |
| io.ktor | ktor-events-jvm | 3.1.3 |  | Ktor event pub/sub infrastructure | https://github.com/ktorio/ktor | Gradle |
| io.ktor | ktor-http-cio-jvm | 3.1.3 |  | Ktor HTTP parsing for the CIO engine | https://github.com/ktorio/ktor | Gradle |
| io.ktor | ktor-http-jvm | 3.1.3 |  | Ktor HTTP types and utilities | https://github.com/ktorio/ktor | Gradle |
| io.ktor | ktor-io-jvm | 3.1.3 |  | Ktor low-level IO primitives | https://github.com/ktorio/ktor | Gradle |
| io.ktor | ktor-network-jvm | 3.1.3 |  | Ktor socket networking | https://github.com/ktorio/ktor | Gradle |
| io.ktor | ktor-network-tls-jvm | 3.1.3 |  | Ktor TLS support for network sockets | https://github.com/ktorio/ktor | Gradle |
| io.ktor | ktor-serialization-jvm | 3.1.3 |  | Ktor content-negotiation serialization support | https://github.com/ktorio/ktor | Gradle |
| io.ktor | ktor-sse-jvm | 3.1.3 |  | Ktor server-sent events support | https://github.com/ktorio/ktor | Gradle |
| io.ktor | ktor-utils-jvm | 3.1.3 |  | Ktor shared utilities | https://github.com/ktorio/ktor | Gradle |
| io.ktor | ktor-websocket-serialization-jvm | 3.1.3 |  | Ktor websocket frame serialization | https://github.com/ktorio/ktor | Gradle |
| io.ktor | ktor-websockets-jvm | 3.1.3 |  | Ktor websocket support | https://github.com/ktorio/ktor | Gradle |
| io.opentelemetry | opentelemetry-api | 1.41.0 |  | OpenTelemetry Java API (traces, metrics, baggage) | https://github.com/open-telemetry/opentelemetry-java | Gradle |
| io.opentelemetry | opentelemetry-context | 1.41.0 |  | OpenTelemetry context propagation API | https://github.com/open-telemetry/opentelemetry-java | Gradle |
| org.apache.groovy | groovy | 4.0.29 |  | Dynamic, optionally-typed JVM language with deep Java integration | https://github.com/apache/groovy | Gradle |
| com.google.guava | failureaccess | 1.0.3 |  | Guava support classes required by ListenableFuture internals | https://github.com/google/guava | Maven |
| com.google.guava | listenablefuture | 9999.0-empty-to-avoid-conflict-with-guava | vendor | Intentionally empty jar to win version resolution against old standalone listenablefuture | https://github.com/google/guava | Maven |
| com.google.j2objc | j2objc-annotations | 3.0.0 |  | Annotations guiding the J2ObjC Java-to-Objective-C translator | https://github.com/google/j2objc | Maven (annotations module; repo also uses Bazel/Make) |
| com.google.protobuf | protobuf-java | 4.28.2 | 2.6.1, 2.x, 3.21.12, debian -> big upgrade | Java runtime for Protocol Buffers serialization | https://github.com/protocolbuffers/protobuf | Bazel (Java artifacts published via Maven) |
| com.google.protobuf | protobuf-kotlin | 4.28.2 | -> big upgrade | Kotlin DSL runtime layered on protobuf-java | https://github.com/protocolbuffers/protobuf | Bazel (Java artifacts published via Maven) |

Questionmark:
| org.jetbrains | annotations-java5 | 24.0.0 |  | Legacy JDK 5-compatible variant of JetBrains annotations | https://github.com/JetBrains/java-annotations | Gradle |


Repackage in build:
| org.jetbrains.intellij.deps | asm-all | 9.6.1 |  | JetBrains-repackaged ASM bytecode framework for IntelliJ Platform | https://github.com/JetBrains/intellij-deps-asm | Gradle |
| org.jetbrains.intellij.deps | gradle-api | 8.13 |  | Repackaged Gradle API jar for IntelliJ tooling | https://github.com/gradle/gradle (repackaged) | Gradle |
| org.jetbrains.intellij.deps | jdom | 2.0.6 | 2.0.6, debian | JetBrains-repackaged JDOM XML library | https://github.com/JetBrains/intellij-deps-jdom | Ant |
| org.jetbrains.intellij.deps | log4j | 1.2.17.2 |  | JetBrains-patched Log4j 1.2 fork for IntelliJ | https://github.com/JetBrains/intellij-deps-log4j | Ant |
| org.jetbrains.intellij.deps.fastutil | intellij-deps-fastutil | 8.5.14-jb1 |  | JetBrains trimmed/patched repackage of fastutil primitive collections | https://github.com/JetBrains/intellij-deps-fastutil | Maven |
| org.jetbrains.intellij.deps.jna | jna | 5.9.0.26 |  | JetBrains-repackaged JNA 5.9 (upstream java-native-access/jna) | https://github.com/java-native-access/jna | Ant (upstream; repackaging JetBrains-internal) |
| org.jetbrains.intellij.deps.jna | jna-platform | 5.9.0.26 |  | JetBrains-repackaged JNA platform 5.9 | https://github.com/java-native-access/jna | Ant (upstream; repackaging JetBrains-internal) |



Skip:
| com.github.gundy | semver4j | 0.16.4 |  | Semantic Versioning library with npm-style range expressions | https://github.com/gundy/semver4j | Maven |
| org.spdx | java-spdx-library | 1.1.12 |  | Core Java library for SPDX SBOM documents | https://github.com/spdx/Spdx-Java-Library | Maven |
| org.spdx | spdx-gradle-plugin | 0.10.0-dev-15 |  | Gradle plugin to generate SPDX SBOMs from builds | https://github.com/spdx/spdx-gradle-plugin | Gradle |
| org.spdx | spdx-jackson-store | 1.1.9.1 |  | Jackson-based SPDX document store | https://github.com/spdx/spdx-java-jackson-store | Maven |
| com.jgoodies | forms | 1.1-preview |  | Old Swing FormLayout layout manager library; no public source repo (freeware from jgoodies.com) | https://www.jgoodies.com/freeware/libraries/forms/ | Unknown |
| com.gradle.publish | plugin-publish-plugin | 2.1.1 | -> disable | Official Gradle Plugin Portal publishing plugin (no public source repo; docs at https://plugins.gradle.org/docs/publish-plugin) | https://plugins.gradle.org/plugin/com.gradle.plugin-publish | Gradle |




BuildDeps:
| com.fasterxml | aalto-xml | 1.3.0 |  | High-performance StAX XML processor with non-blocking async parsing | https://github.com/FasterXML/aalto-xml | Maven |
| com.fasterxml | aalto-xml | 1.3.3 | has bootstrap | High-performance StAX XML processor with non-blocking async parsing | https://github.com/FasterXML/aalto-xml | Maven |
| com.fasterxml.woodstox | woodstox-core | 7.1.1 | 6.2.1, need upgrade | Feature-complete StAX XML pull-parser implementation | https://github.com/FasterXML/woodstox | Maven |
| commons-codec | commons-codec | 1.17.1 | 1.22.0, debian | Base64/Hex/Base32/digest encoders-decoders and phonetic encodings | https://github.com/apache/commons-codec | Maven |
| commons-codec | commons-codec | 1.21.0 | 1.22.0, debian | Base64/Hex/Base32/digest encoders-decoders and phonetic encodings | https://github.com/apache/commons-codec | Maven |
| commons-io | commons-io | 2.18.0 | 2.22.0, debian | File and stream utility classes | https://github.com/apache/commons-io | Maven |
| commons-io | commons-io | 2.21.0 | 2.22.0, debian | File and stream utility classes | https://github.com/apache/commons-io | Maven |
| io.github.java-diff-utils | java-diff-utils | 4.12 | 4.9, debian | Text/sequence diff and patch library (Myers, unified diffs) | https://github.com/java-diff-utils/java-diff-utils | Maven |
| io.vavr | vavr | 0.10.4 | 0.10.3, 0.x | Object-functional library for Java (persistent collections, control structures) | https://github.com/vavr-io/vavr | Maven |
| io.vavr | vavr-match | 0.10.4 | 0.10.3, 0.x | Pattern-matching module of Vavr | https://github.com/vavr-io/vavr | Maven |
| javax.annotation | jsr250-api | 1.0 | debian | JSR-250 common annotations API jar (@Resource, @PostConstruct, ...); old java.net publication, no public repo | n/a (defunct java.net) | Unknown |
| javax.inject | javax.inject | 1 | 1, debian | JSR-330 Dependency Injection standard API (@Inject, @Named, ...) | https://github.com/javax-inject/javax-inject | Maven |
| jaxen | jaxen | 1.2.0 | 1.2.0, debian | Engine-agnostic XPath library adaptable to DOM/JDOM/dom4j/XOM | https://github.com/jaxen-xpath/jaxen | Maven |
| net.java.dev.jna | jna | 5.14.0 | 5.18.1, debian | Java Native Access - call native libraries without JNI | https://github.com/java-native-access/jna | Ant |
| net.java.dev.jna | jna-platform | 5.14.0 | 5.18.1, debian | Pre-mapped platform APIs (Win32, X11, ...) for JNA | https://github.com/java-native-access/jna | Ant |
| one.util | streamex | 0.7.2 |  | Enhanced Java 8 Stream API (StreamEx, EntryStream, more collectors) | https://github.com/amaembo/streamex | Maven |
| org.antlr | antlr4-runtime | 4.13.2 | 4.9.2, debian | Java runtime required by ANTLR4-generated parsers | https://github.com/antlr/antlr4 | Maven |
| org.apache.ant | ant | 1.10.15 | 1.10.17, debian | XML-based Java build tool, core engine and tasks | https://github.com/apache/ant | Ant (self-hosted) |
| org.apache.ant | ant-launcher | 1.10.15 | 1.10.17, debian | Launcher JAR used to start Ant builds | https://github.com/apache/ant | Ant (self-hosted) |
| org.apache.commons | commons-compress | 1.27.1 | 1.27.1, debian | Compression/archive formats API (zip, tar, 7z, xz, zstd, ...) | https://github.com/apache/commons-compress | Maven |
| org.apache.commons | commons-lang3 | 3.18.0 | 3.20.0, 3.x, debian | General-purpose java.lang utilities (StringUtils, ObjectUtils, ...) | https://github.com/apache/commons-lang | Maven |
| org.apache.logging.log4j | log4j-api | 2.25.3 | 2.19.0, debian | Log4j 2 logging framework API | https://github.com/apache/logging-log4j2 | Maven |
| org.apache.logging.log4j | log4j-core | 2.25.3 | 2.19.0, debian | Log4j 2 logging framework implementation | https://github.com/apache/logging-log4j2 | Maven |
| org.apache.maven | maven-api-annotations | 4.0.0-rc-5 |  | Maven core API annotations | https://github.com/apache/maven | Maven |
| org.apache.maven | maven-api-xml | 4.0.0-rc-5 |  | Maven core XML API | https://github.com/apache/maven | Maven |
| org.apache.maven | maven-artifact | 3.9.9 | 3.9.12, 3.x | Maven artifact/resolution support | https://github.com/apache/maven | Maven |
| org.apache.maven | maven-builder-support | 3.9.9 | 3.9.12, 3.x | Support classes for Maven model building | https://github.com/apache/maven | Maven |
| org.apache.maven | maven-model | 3.6.3 | 3.9.12, 3.x | Maven POM object model | https://github.com/apache/maven | Maven |
| org.apache.maven | maven-model | 3.9.9 | 3.9.12, 3.x | Maven POM object model | https://github.com/apache/maven | Maven |
| org.apache.maven | maven-model-builder | 3.9.9 | 3.9.12, 3.x | Maven effective-POM builder | https://github.com/apache/maven | Maven |
| org.apache.maven | maven-xml | 4.0.0-rc-5 |  | Maven XML support module | https://github.com/apache/maven | Maven |
| org.apache.maven | maven-xml-impl | 4.0.0-beta-5 |  | Maven XML implementation module | https://github.com/apache/maven | Maven |
| org.bouncycastle | bcpg-jdk18on | 1.84 | debian | Bouncy Castle OpenPGP API (JDK 1.8+ line) | https://github.com/bcgit/bc-java | Gradle (legacy Ant scripts) |
| org.bouncycastle | bcpkix-jdk18on | 1.84 | debian | Bouncy Castle PKIX/cert-path APIs | https://github.com/bcgit/bc-java | Gradle (legacy Ant scripts) |
| org.bouncycastle | bcprov-jdk18on | 1.84 | debian | Bouncy Castle JCE crypto provider | https://github.com/bcgit/bc-java | Gradle (legacy Ant scripts) |
| org.bouncycastle | bcutil-jdk18on | 1.84 | debian | Bouncy Castle shared utilities | https://github.com/bcgit/bc-java | Gradle (legacy Ant scripts) |
| org.checkerframework | checker-qual | 3.43.0 | 3.2.0, debian | Type-qualifier annotations for the Checker Framework (@NonNull, ...) | https://github.com/typetools/checker-framework | Gradle |
| org.codehaus.plexus | plexus-interpolation | 1.27 | 1.27, debian | ${...} property interpolation engine used by Maven POM processing | https://github.com/codehaus-plexus/plexus-interpolation | Maven |
| org.codehaus.plexus | plexus-utils | 4.0.2 | 2.x, 3.4.2, debian | String/file/CLI/process utilities maintained alongside Maven | https://github.com/codehaus-plexus/plexus-utils | Maven |
| org.codehaus.plexus | plexus-xml | 4.1.1 | 3.0.1, debian | Xpp3Dom/XML pull-parser classes extracted from plexus-utils | https://github.com/codehaus-plexus/plexus-xml | Maven |
| org.codehaus.woodstox | stax2-api | 4.2.1 | 4.1, debian | Extension API to the standard StAX pull-parsing API | https://github.com/FasterXML/stax2-api | Maven |
| org.codehaus.woodstox | stax2-api | 4.2.2 | 4.1, debian | Extension API to the standard StAX pull-parsing API | https://github.com/FasterXML/stax2-api | Maven |
| org.eclipse.sisu | org.eclipse.sisu.inject | 0.9.0.M3 | 0.3.5, debian | JSR-330 DI container built on Guice (Maven's component wiring layer) | https://github.com/eclipse-sisu/sisu-project | Maven |
| org.fusesource.jansi | jansi | 2.4.0 | 1.x, 2.4.2, debian | ANSI colored console output incl. Windows (unmaintained; merged into JLine) | https://github.com/fusesource/jansi | Maven |
| org.jdom | jdom2 | 2.0.6.1 | 2.0.5, debian | Java-idiomatic collections-style XML API (2.x line) | https://github.com/hunterhacker/jdom | Ant |
| org.jetbrains | annotations | 13.0 | 23.0.0-SNAPSHOT, debian | JetBrains JVM annotations (@NotNull, @Nullable, @Contract, ...) | https://github.com/JetBrains/java-annotations | Gradle |
| org.jetbrains | annotations | 23.0.0 | 23.0.0-SNAPSHOT, debian | JetBrains JVM annotations (@NotNull, @Nullable, @Contract, ...) | https://github.com/JetBrains/java-annotations | Gradle |
| org.jetbrains | annotations | 24.0.0 | 23.0.0-SNAPSHOT, debian | JetBrains JVM annotations (@NotNull, @Nullable, @Contract, ...) | https://github.com/JetBrains/java-annotations | Gradle |
| org.jetbrains | annotations | 24.0.1 | 23.0.0-SNAPSHOT, debian | JetBrains JVM annotations (@NotNull, @Nullable, @Contract, ...) | https://github.com/JetBrains/java-annotations | Gradle |
| org.jline | jline | 3.24.1 | 3.3.1, debian | Console input handling: line editing, history, completion, ANSI terminals | https://github.com/jline/jline3 | Maven |
| org.json | json | 20231013 | 20090211, 20180130, debian, debian-android, debian-latest | Reference org.json JSON parser/generator (JSONObject, JSONArray) | https://github.com/stleary/JSON-java | Maven |
| org.jsoup | jsoup | 1.15.3 | 1.15.3, debian | HTML parser/DOM with CSS selectors and XSS sanitizing | https://github.com/jhy/jsoup | Maven |
| org.jspecify | jspecify | 1.0.0 | 1.0.0, debian | Tool-agnostic nullness annotations (@Nullable, @NullMarked) | https://github.com/jspecify/jspecify | Gradle |
| org.lz4 | lz4-java | 1.7.1 | 1.8.0, debian | LZ4 block/stream compression for the JVM (JNI and pure Java) | https://github.com/lz4/lz4-java | Ant + Ivy |
| org.lz4 | lz4-java | 1.8.0 | 1.8.0, debian | LZ4 block/stream compression for the JVM (JNI and pure Java) | https://github.com/lz4/lz4-java | Ant + Ivy |
| org.ow2.asm | asm | 9.6 | 9.9.1, debian | Java bytecode manipulation and analysis framework | https://gitlab.ow2.org/asm/asm | Gradle |
| org.ow2.asm | asm-tree | 9.6 | 9.9.1, debian | ASM tree API for bytecode analysis | https://gitlab.ow2.org/asm/asm | Gradle |
| org.slf4j | log4j-over-slf4j | 1.7.36 | 1.7.32, 2.0.17, 2.x, debian | Routes Log4j 1.x calls through SLF4J | https://github.com/qos-ch/slf4j | Maven |
| org.slf4j | slf4j-api | 2.0.16 | 1.7.32, 2.0.17, 2.x, debian | Simple Logging Facade for Java | https://github.com/qos-ch/slf4j | Maven |
| org.slf4j | slf4j-api | 2.0.17 | 1.7.32, 2.0.17, 2.x, debian | Simple Logging Facade for Java | https://github.com/qos-ch/slf4j | Maven |
| org.tukaani | xz | 1.10 | 1.11, debian | Pure-Java XZ (LZMA2) compression | https://tukaani.org/xz/java.html | Ant |
| org.vafer | jdependency | 2.15 | 2.10, debian | ASM-based class/package dependency analysis of jars | https://github.com/tcurdt/jdependency | Maven |
| org.yaml | snakeyaml | 2.2 | 2.5, 2.x | YAML 1.1 parser/emitter with JavaBeans binding | https://github.com/snakeyaml/snakeyaml | Maven |
| oro | oro | 2.0.8 | 2.0.8, debian | Retired Apache Jakarta Oro Perl5-style regex library | https://attic.apache.org/projects/jakarta-oro.html | Ant |


Bootstrap:
| org.jetbrains.kotlin | abi-tools-api | 2.3.0 |  | Kotlin ABI tools API | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | abi-tools-api | 2.4.0-dev-8449 |  | Kotlin ABI tools API | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | fus-statistics-gradle-plugin | 2.3.0 |  | Kotlin feature-usage statistics Gradle plugin | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | fus-statistics-gradle-plugin | 2.4.0-dev-8449 |  | Kotlin feature-usage statistics Gradle plugin | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-assignment | 2.3.0 |  | Kotlin assignment compiler plugin (Gradle-facing) | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-assignment-compiler-plugin-embeddable | 2.2.21 |  | Embeddable Kotlin assignment compiler plugin | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-build-gradle-plugin | 0.0.42 |  | Internal Kotlin build Gradle plugin | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-build-statistics | 2.3.0 |  | Kotlin build statistics reporting | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-build-statistics | 2.4.0-dev-8449 |  | Kotlin build statistics reporting | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-build-tools-api | 2.2.21 |  | Kotlin build tools API (compilation service interface) | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-build-tools-api | 2.3.0 |  | Kotlin build tools API (compilation service interface) | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-build-tools-api | 2.4.0-dev-8449 |  | Kotlin build tools API (compilation service interface) | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-build-tools-compat | 2.4.0-dev-8449 |  | Kotlin build tools compatibility layer | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-build-tools-cri-impl | 2.4.0-dev-8449 |  | Kotlin build tools CRI implementation | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-build-tools-impl | 2.2.21 |  | Kotlin build tools implementation | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-build-tools-impl | 2.4.0-dev-8449 |  | Kotlin build tools implementation | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-compiler-embeddable | 2.2.21 | 1.3.31, debian | Embeddable Kotlin compiler | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-compiler-embeddable | 2.4.0-dev-8449 | 1.3.31, debian | Embeddable Kotlin compiler | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-compiler-runner | 2.2.21 | 1.3.31, debian | Kotlin compiler runner for build integrations | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-compiler-runner | 2.3.0 | 1.3.31, debian | Kotlin compiler runner for build integrations | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-compiler-runner | 2.4.0-dev-8449 | 1.3.31, debian | Kotlin compiler runner for build integrations | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-daemon-client | 2.2.21 | 1.3.31, debian | Client for the Kotlin compile daemon | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-daemon-client | 2.3.0 | 1.3.31, debian | Client for the Kotlin compile daemon | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-daemon-client | 2.4.0-dev-8449 | 1.3.31, debian | Client for the Kotlin compile daemon | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-daemon-embeddable | 2.2.21 |  | Embeddable Kotlin compile daemon | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-daemon-embeddable | 2.4.0-dev-8449 |  | Embeddable Kotlin compile daemon | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-gradle-plugin | 2.3.0 | 1.3.31, debian | Kotlin Gradle plugin | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-gradle-plugin | 2.4.0-dev-8449 | 1.3.31, debian | Kotlin Gradle plugin | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-gradle-plugin-annotations | 2.3.0 |  | Annotations for the Kotlin Gradle plugin API | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-gradle-plugin-annotations | 2.4.0-dev-8449 |  | Annotations for the Kotlin Gradle plugin API | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-gradle-plugin-api | 2.3.0 | 1.3.31, debian | Public API of the Kotlin Gradle plugin | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-gradle-plugin-api | 2.4.0-dev-8449 | 1.3.31, debian | Public API of the Kotlin Gradle plugin | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-gradle-plugin-idea | 2.3.0 |  | IDEA integration model for the Kotlin Gradle plugin | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-gradle-plugin-idea | 2.4.0-dev-8449 |  | IDEA integration model for the Kotlin Gradle plugin | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-gradle-plugin-idea-proto | 2.3.0 |  | Protobuf model for Kotlin Gradle plugin IDEA integration | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-gradle-plugin-idea-proto | 2.4.0-dev-8449 |  | Protobuf model for Kotlin Gradle plugin IDEA integration | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-klib-commonizer-api | 2.3.0 |  | API for the Kotlin KLIB commonizer | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-klib-commonizer-api | 2.4.0-dev-8449 |  | API for the Kotlin KLIB commonizer | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-metadata-jvm | 2.2.21 |  | Read/write Kotlin @Metadata (now in kotlin repo, formerly kotlinx-metadata) | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-metadata-jvm | 2.3.20-RC |  | Read/write Kotlin @Metadata (now in kotlin repo, formerly kotlinx-metadata) | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-metadata-jvm | 2.4.0-dev-8449 |  | Read/write Kotlin @Metadata (now in kotlin repo, formerly kotlinx-metadata) | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-native-utils | 2.3.0 | 1.3.31, debian | Utilities for Kotlin/Native tooling | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-native-utils | 2.4.0-dev-8449 | 1.3.31, debian | Utilities for Kotlin/Native tooling | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-reflect | 1.6.10 | 1.3.31, debian | Kotlin reflection library | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-reflect | 2.1.21 | 1.3.31, debian | Kotlin reflection library | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-reflect | 2.3.0 | 1.3.31, debian | Kotlin reflection library | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-reflect | 2.4.0-dev-8449 | 1.3.31, debian | Kotlin reflection library | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-sam-with-receiver | 2.3.0 | 1.3.31, debian | Kotlin SAM-with-receiver compiler plugin (Gradle-facing) | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-sam-with-receiver-compiler-plugin-embeddable | 2.2.21 |  | Embeddable SAM-with-receiver compiler plugin | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-script-runtime | 2.2.21 | 1.3.31, debian | Kotlin scripting runtime | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-script-runtime | 2.4.0-dev-8449 | 1.3.31, debian | Kotlin scripting runtime | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-scripting-common | 2.2.21 | 1.3.31, debian | Common Kotlin scripting support | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-scripting-common | 2.4.0-dev-8449 | 1.3.31, debian | Common Kotlin scripting support | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-scripting-compiler-embeddable | 2.2.21 | 1.3.31, debian | Embeddable Kotlin scripting compiler | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-scripting-compiler-embeddable | 2.4.0-dev-8449 | 1.3.31, debian | Embeddable Kotlin scripting compiler | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-scripting-compiler-impl-embeddable | 2.2.21 |  | Embeddable Kotlin scripting compiler implementation | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-scripting-compiler-impl-embeddable | 2.4.0-dev-8449 |  | Embeddable Kotlin scripting compiler implementation | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-scripting-jvm | 2.2.21 | 1.3.31, debian | JVM Kotlin scripting support | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-scripting-jvm | 2.4.0-dev-8449 | 1.3.31, debian | JVM Kotlin scripting support | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-serialization | 2.4.0-dev-8449 |  | Kotlin serialization compiler plugin (Gradle-facing) | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-serialization-compiler-plugin-embeddable | 2.2.21 |  | Embeddable Kotlin serialization compiler plugin | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-serialization-compiler-plugin-embeddable | 2.4.0-dev-8449 |  | Embeddable Kotlin serialization compiler plugin | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-stdlib | 1.6.0 | 1.3.31, debian | Kotlin standard library | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-stdlib | 1.7.0 | 1.3.31, debian | Kotlin standard library | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-stdlib | 1.7.10 | 1.3.31, debian | Kotlin standard library | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-stdlib | 2.2.21 | 1.3.31, debian | Kotlin standard library | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-stdlib | 2.3.0 | 1.3.31, debian | Kotlin standard library | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-stdlib | 2.3.20-RC | 1.3.31, debian | Kotlin standard library | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-stdlib | 2.4.0-dev-8449 | 1.3.31, debian | Kotlin standard library | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-stdlib-common | 1.6.0 | 1.3.31, debian | Kotlin multiplatform common stdlib metadata | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-stdlib-common | 1.7.0 | 1.3.31, debian | Kotlin multiplatform common stdlib metadata | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-stdlib-common | 1.7.10 | 1.3.31, debian | Kotlin multiplatform common stdlib metadata | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-stdlib-jdk7 | 1.7.10 | 1.3.31, debian | Kotlin stdlib JDK7 extensions | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-stdlib-jdk8 | 1.7.10 | 1.3.31, debian | Kotlin stdlib JDK8 extensions | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-test | 2.2.21 | 1.3.31, debian | Kotlin test framework | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-tooling-core | 2.3.0 |  | Core model for Kotlin build tooling | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-tooling-core | 2.4.0-dev-8449 |  | Core model for Kotlin build tooling | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-util-io | 2.3.0 |  | Kotlin internal IO utilities | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-util-io | 2.4.0-dev-8449 |  | Kotlin internal IO utilities | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-util-klib | 2.3.0 |  | Kotlin internal KLIB utilities | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-util-klib | 2.4.0-dev-8449 |  | Kotlin internal KLIB utilities | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-util-klib-metadata | 2.3.0 |  | Kotlin internal KLIB metadata utilities | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | kotlin-util-klib-metadata | 2.4.0-dev-8449 |  | Kotlin internal KLIB metadata utilities | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | protobuf-lite | 2.6.1-2 |  | Repackaged/shaded Google protobuf 2.6.1 built from dependencies/protobuf in the Kotlin repo | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlin | protobuf-relocated | 2.6.1-2 |  | Relocated/repackaged Google protobuf 2.6.1 built from the Kotlin repo | https://github.com/JetBrains/kotlin | Gradle |
| org.jetbrains.kotlinx | binary-compatibility-validator | 0.17.0 |  | Gradle plugin for API-dump/binary-compatibility checking | https://github.com/Kotlin/binary-compatibility-validator | Gradle |
| org.jetbrains.kotlinx | kotlinx-collections-immutable-jvm | 0.3.7 |  | Immutable/persistent collections for Kotlin | https://github.com/Kotlin/kotlinx.collections.immutable | Gradle |
| org.jetbrains.kotlinx | kotlinx-collections-immutable-jvm | 0.3.8 |  | Immutable/persistent collections for Kotlin | https://github.com/Kotlin/kotlinx.collections.immutable | Gradle |
| org.jetbrains.kotlinx | kotlinx-coroutines-core-jvm | 1.10.2 |  | Kotlin coroutines core | https://github.com/Kotlin/kotlinx.coroutines | Gradle |
| org.jetbrains.kotlinx | kotlinx-coroutines-core-jvm | 1.8.0 |  | Kotlin coroutines core | https://github.com/Kotlin/kotlinx.coroutines | Gradle |
| org.jetbrains.kotlinx | kotlinx-coroutines-slf4j | 1.10.2 |  | SLF4J MDC integration for coroutines | https://github.com/Kotlin/kotlinx.coroutines | Gradle |
| org.jetbrains.kotlinx | kotlinx-io-bytestring-jvm | 0.7.0 |  | Multiplatform ByteString primitives | https://github.com/Kotlin/kotlinx-io | Gradle |
| org.jetbrains.kotlinx | kotlinx-io-core-jvm | 0.7.0 |  | Multiplatform IO primitives | https://github.com/Kotlin/kotlinx-io | Gradle |
| org.jetbrains.kotlinx | kotlinx-serialization-core-jvm | 1.4.0 |  | Kotlin multi-format serialization framework, core | https://github.com/Kotlin/kotlinx.serialization | Gradle |
| org.jetbrains.kotlinx | kotlinx-serialization-core-jvm | 1.7.3 |  | Kotlin multi-format serialization framework, core | https://github.com/Kotlin/kotlinx.serialization | Gradle |
| org.jetbrains.kotlinx | kotlinx-serialization-core-jvm | 1.8.1 |  | Kotlin multi-format serialization framework, core | https://github.com/Kotlin/kotlinx.serialization | Gradle |
| org.jetbrains.kotlinx | kotlinx-serialization-json-jvm | 1.4.0 |  | JSON support for kotlinx.serialization | https://github.com/Kotlin/kotlinx.serialization | Gradle |
| org.jetbrains.kotlinx | kotlinx-serialization-json-jvm | 1.7.3 |  | JSON support for kotlinx.serialization | https://github.com/Kotlin/kotlinx.serialization | Gradle |
| org.jetbrains.kotlinx | kotlinx-serialization-protobuf-jvm | 1.7.3 |  | Protobuf support for kotlinx.serialization | https://github.com/Kotlin/kotlinx.serialization | Gradle |
| org.jetbrains.teamcity | serviceMessages | 2019.1.4 |  | Emit TeamCity ##teamcity[...] service messages from build tools (no public source repo) | n/a (JetBrains-internal TeamCity codebase) | Unknown |

Bootstrap (Gradle):
| org.gradle.experimental | gradle-public-api | 9.5.0 |  | Versioned Gradle Public API jar (module packaging/public-api of gradle/gradle) | https://github.com/gradle/gradle | Gradle |
| org.gradle.kotlin | gradle-kotlin-dsl-plugins | 6.5.2 |  | Gradle Kotlin DSL plugins incl. precompiled script plugin support | https://github.com/gradle/gradle | Gradle |
| org.gradle.plugin | compatibility-plugin | 1.0.0 |  | Declares plugin compatibility with Gradle features (Configuration Cache, Isolated Projects) | https://github.com/gradle/gradle-plugin-compatibility-plugin | Gradle |

