# IntelliJ Bazel Cache Dependencies

Generated from `intellij-community/lib/MODULE.bazel` and `intellij-community/build/jvm-rules/MODULE.bazel`.
Total unique Maven coordinates: **184** (Java: 175, Native: 9).

Classifiers (`jar`, `sources`, platform-specific) show which variants were fetched into the cache.

> The cache also contains Bazel module source archives and JDK/toolchain distributions
> (e.g. `abseil-cpp+`, `protobuf+`, `rules_*`, `remotejdk21_linux`) that are build-time
> infrastructure rather than project dependencies; they are listed in the **Toolchain Dependencies** sections below.

## Summary

- Java dependencies: 175
- Native dependencies: 9
- Non-Maven build dependency: `jps-standalone_http` (https://packages.jetbrains.team/files/p/ij/intellij-build-dependencies/jps/jps-build-standalone-19.02.25.jar)
- Binary toolchain dependencies: 3
- Vendor / source-only toolchain dependencies: 25

## Java Dependencies

| Maven Coordinate | Version | Upstream URL | Classifiers | Debian Version |
|---|---|---|---|---|
| `com.amazon.ion:ion-java:1.11.9` | 1.11.9 | [ion-java-1.11.9.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/amazon/ion/ion-java/1.11.9/ion-java-1.11.9.jar) | jar, sources | — |
| `com.auth0:java-jwt:4.3.0` | 4.3.0 | [java-jwt-4.3.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/auth0/java-jwt/4.3.0/java-jwt-4.3.0.jar) | jar, sources | — |
| `com.dynatrace.hash4j:hash4j:0.20.0` | 0.20.0 | [hash4j-0.20.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/dynatrace/hash4j/hash4j/0.20.0/hash4j-0.20.0.jar) | jar, sources | — |
| `com.fasterxml.jackson.core:jackson-annotations:2.17.2` | 2.17.2 | [jackson-annotations-2.17.2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-annotations/2.17.2/jackson-annotations-2.17.2.jar) | jar, sources | — |
| `com.fasterxml.jackson.core:jackson-core:2.17.0` | 2.17.0 | [jackson-core-2.17.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.17.0/jackson-core-2.17.0.jar) | jar, sources | — |
| `com.fasterxml.jackson.core:jackson-databind:2.17.2` | 2.17.2 | [jackson-databind-2.17.2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.17.2/jackson-databind-2.17.2.jar) | jar, sources | — |
| `com.fasterxml.jackson.dataformat:jackson-dataformat-xml:2.15.0` | 2.15.0 | [jackson-dataformat-xml-2.15.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-xml/2.15.0/jackson-dataformat-xml-2.15.0.jar) | jar, sources | — |
| `com.fasterxml.jackson.dataformat:jackson-dataformat-yaml:2.17.2` | 2.17.2 | [jackson-dataformat-yaml-2.17.2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-yaml/2.17.2/jackson-dataformat-yaml-2.17.2.jar) | jar, sources | — |
| `com.fasterxml.jackson.datatype:jackson-datatype-joda:2.17.2` | 2.17.2 | [jackson-datatype-joda-2.17.2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/fasterxml/jackson/datatype/jackson-datatype-joda/2.17.2/jackson-datatype-joda-2.17.2.jar) | jar, sources | 2.12.1 |
| `com.fasterxml.jackson.jr:jackson-jr-objects:2.17.2` | 2.17.2 | [jackson-jr-objects-2.17.2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/fasterxml/jackson/jr/jackson-jr-objects/2.17.2/jackson-jr-objects-2.17.2.jar) | jar, sources | 2.14.0 |
| `com.fasterxml.jackson.module:jackson-module-kotlin:2.17.2` | 2.17.2 | [jackson-module-kotlin-2.17.2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/fasterxml/jackson/module/jackson-module-kotlin/2.17.2/jackson-module-kotlin-2.17.2.jar) | jar, sources | — |
| `com.fasterxml:aalto-xml:1.3.3` | 1.3.3 | [aalto-xml-1.3.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/fasterxml/aalto-xml/1.3.3/aalto-xml-1.3.3.jar) | jar, sources | — |
| `com.github.ben-manes.caffeine:caffeine:3.2.0` | 3.2.0 | [caffeine-3.2.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/github/ben-manes/caffeine/caffeine/3.2.0/caffeine-3.2.0.jar) | jar, sources | 2.6.2 |
| `com.github.spullara.cli-parser:cli-parser:1.1.6` | 1.1.6 | [cli-parser-1.1.6.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/github/spullara/cli-parser/cli-parser/1.1.6/cli-parser-1.1.6.jar) | jar, sources | — |
| `com.google.code.gson:gson:2.12.1` | 2.12.1 | [gson-2.12.1.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/google/code/gson/gson/2.12.1/gson-2.12.1.jar) | jar, sources | 2.10.1 |
| `com.google.flatbuffers:flatbuffers-java:25.2.10` | 25.2.10 | [flatbuffers-java-25.2.10.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/google/flatbuffers/flatbuffers-java/25.2.10/flatbuffers-java-25.2.10.jar) | jar, sources | — |
| `com.google.guava:failureaccess:1.0.2` | 1.0.2 | [failureaccess-1.0.2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/google/guava/failureaccess/1.0.2/failureaccess-1.0.2.jar) | jar, sources | — |
| `com.google.guava:guava:33.4.0-jre` | 33.4.0-jre | [guava-33.4.0-jre.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/google/guava/guava/33.4.0-jre/guava-33.4.0-jre.jar) | jar, sources | 32.0.1-jre |
| `com.google.j2objc:j2objc-annotations:3.0.0` | 3.0.0 | [j2objc-annotations-3.0.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/google/j2objc/j2objc-annotations/3.0.0/j2objc-annotations-3.0.0.jar) | jar, sources | — |
| `com.google.protobuf:protobuf-java:3.24.4-jb.2` | 3.24.4-jb.2 | [protobuf-java-3.24.4-jb.2.jar](https://cache-redirector.jetbrains.com/packages.jetbrains.team/maven/p/ij/intellij-dependencies/com/google/protobuf/protobuf-java/3.24.4-jb.2/protobuf-java-3.24.4-jb.2.jar) | jar, sources | 3.21.12 |
| `com.google.protobuf:protobuf-java:4.29.3` | 4.29.3 | [protobuf-java-4.29.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/google/protobuf/protobuf-java/4.29.3/protobuf-java-4.29.3.jar) | jar, sources | 3.21.12 |
| `com.h2database:h2-mvstore:2.3.232` | 2.3.232 | [h2-mvstore-2.3.232.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/h2database/h2-mvstore/2.3.232/h2-mvstore-2.3.232.jar) | jar, sources | — |
| `com.intellij.platform:kotlinx-coroutines-core-jvm:1.8.0-intellij-12` | 1.8.0-intellij-12 | [kotlinx-coroutines-core-jvm-1.8.0-int...](https://cache-redirector.jetbrains.com/packages.jetbrains.team/maven/p/ij/intellij-dependencies/com/intellij/platform/kotlinx-coroutines-core-jvm/1.8.0-intellij-12/kotlinx-coroutines-core-jvm-1.8.0-intellij-12.jar) | jar, sources | — |
| `com.intellij.platform:kotlinx-coroutines-debug:1.8.0-intellij-12` | 1.8.0-intellij-12 | [kotlinx-coroutines-debug-1.8.0-intell...](https://cache-redirector.jetbrains.com/packages.jetbrains.team/maven/p/ij/intellij-dependencies/com/intellij/platform/kotlinx-coroutines-debug/1.8.0-intellij-12/kotlinx-coroutines-debug-1.8.0-intellij-12.jar) | jar, sources | — |
| `com.intellij.platform:kotlinx-coroutines-slf4j:1.8.0-intellij-12` | 1.8.0-intellij-12 | [kotlinx-coroutines-slf4j-1.8.0-intell...](https://cache-redirector.jetbrains.com/packages.jetbrains.team/maven/p/ij/intellij-dependencies/com/intellij/platform/kotlinx-coroutines-slf4j/1.8.0-intellij-12/kotlinx-coroutines-slf4j-1.8.0-intellij-12.jar) | jar, sources | — |
| `com.jetbrains.format-ripper:format-ripper:1.1.1` | 1.1.1 | [format-ripper-1.1.1.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/jetbrains/format-ripper/format-ripper/1.1.1/format-ripper-1.1.1.jar) | jar, sources | — |
| `com.jetbrains.intellij.devkit:devkit-runtime-module-repository-jps:251.16369` | 251.16369 | [devkit-runtime-module-repository-jps-...](https://cache-redirector.jetbrains.com/packages.jetbrains.team/maven/p/ij/intellij-dependencies/com/jetbrains/intellij/devkit/devkit-runtime-module-repository-jps/251.16369/devkit-runtime-module-repository-jps-251.16369.jar) | jar, sources | — |
| `com.jetbrains:jbr-api:1.2.0` | 1.2.0 | [jbr-api-1.2.0.jar](https://cache-redirector.jetbrains.com/packages.jetbrains.team/maven/p/ij/intellij-dependencies/com/jetbrains/jbr-api/1.2.0/jbr-api-1.2.0.jar) | jar, sources | — |
| `com.jgoodies:forms:1.1-preview` | 1.1-preview | [forms-1.1-preview.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/jgoodies/forms/1.1-preview/forms-1.1-preview.jar) | jar | — |
| `com.networknt:json-schema-validator:1.3.1` | 1.3.1 | [json-schema-validator-1.3.1.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/networknt/json-schema-validator/1.3.1/json-schema-validator-1.3.1.jar) | jar, sources | — |
| `com.squareup.okhttp3:okhttp:5.0.0-alpha.14` | 5.0.0-alpha.14 | [okhttp-5.0.0-alpha.14.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/squareup/okhttp3/okhttp/5.0.0-alpha.14/okhttp-5.0.0-alpha.14.jar) | jar, sources | 3.13.1 |
| `com.squareup.okio:okio-jvm:3.9.0` | 3.9.0 | [okio-jvm-3.9.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/squareup/okio/okio-jvm/3.9.0/okio-jvm-3.9.0.jar) | jar, sources | — |
| `com.sun.activation:jakarta.activation:1.2.2` | 1.2.2 | [jakarta.activation-1.2.2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/sun/activation/jakarta.activation/1.2.2/jakarta.activation-1.2.2.jar) | jar, sources | 2.0.0 |
| `com.sun.activation:javax.activation:1.2.0` | 1.2.0 | [javax.activation-1.2.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/sun/activation/javax.activation/1.2.0/javax.activation-1.2.0.jar) | jar, sources | 1.2.0 |
| `com.sun.istack:istack-commons-runtime:3.0.12` | 3.0.12 | [istack-commons-runtime-3.0.12.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/sun/istack/istack-commons-runtime/3.0.12/istack-commons-runtime-3.0.12.jar) | jar, sources | 3.0.6 |
| `com.thoughtworks.qdox:qdox:2.2.0` | 2.2.0 | [qdox-2.2.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/thoughtworks/qdox/qdox/2.2.0/qdox-2.2.0.jar) | jar, sources | 1.12.1 |
| `commons-cli:commons-cli:1.9.0` | 1.9.0 | [commons-cli-1.9.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/commons-cli/commons-cli/1.9.0/commons-cli-1.9.0.jar) | jar, sources | 1.6.0 |
| `commons-codec:commons-codec:1.17.1` | 1.17.1 | [commons-codec-1.17.1.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/commons-codec/commons-codec/1.17.1/commons-codec-1.17.1.jar) | jar, sources | 1.22.0 |
| `commons-io:commons-io:2.16.1` | 2.16.1 | [commons-io-2.16.1.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/commons-io/commons-io/2.16.1/commons-io-2.16.1.jar) | jar, sources | 2.22.0 |
| `commons-logging:commons-logging:1.2` | 1.2 | [commons-logging-1.2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/commons-logging/commons-logging/1.2/commons-logging-1.2.jar) | jar, sources | 1.3.0 |
| `io.ktor:ktor-client-auth-jvm:3.0.3` | 3.0.3 | [ktor-client-auth-jvm-3.0.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-client-auth-jvm/3.0.3/ktor-client-auth-jvm-3.0.3.jar) | jar, sources | — |
| `io.ktor:ktor-client-content-negotiation-jvm:3.0.3` | 3.0.3 | [ktor-client-content-negotiation-jvm-3...](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-client-content-negotiation-jvm/3.0.3/ktor-client-content-negotiation-jvm-3.0.3.jar) | jar, sources | — |
| `io.ktor:ktor-client-core-jvm:3.0.3` | 3.0.3 | [ktor-client-core-jvm-3.0.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-client-core-jvm/3.0.3/ktor-client-core-jvm-3.0.3.jar) | jar, sources | — |
| `io.ktor:ktor-client-encoding-jvm:3.0.3` | 3.0.3 | [ktor-client-encoding-jvm-3.0.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-client-encoding-jvm/3.0.3/ktor-client-encoding-jvm-3.0.3.jar) | jar, sources | — |
| `io.ktor:ktor-client-okhttp-jvm:3.0.3` | 3.0.3 | [ktor-client-okhttp-jvm-3.0.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-client-okhttp-jvm/3.0.3/ktor-client-okhttp-jvm-3.0.3.jar) | jar, sources | — |
| `io.ktor:ktor-events-jvm:3.0.3` | 3.0.3 | [ktor-events-jvm-3.0.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-events-jvm/3.0.3/ktor-events-jvm-3.0.3.jar) | jar, sources | — |
| `io.ktor:ktor-http-jvm:3.0.3` | 3.0.3 | [ktor-http-jvm-3.0.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-http-jvm/3.0.3/ktor-http-jvm-3.0.3.jar) | jar, sources | — |
| `io.ktor:ktor-io-jvm:3.0.3` | 3.0.3 | [ktor-io-jvm-3.0.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-io-jvm/3.0.3/ktor-io-jvm-3.0.3.jar) | jar, sources | — |
| `io.ktor:ktor-serialization-jvm:3.0.3` | 3.0.3 | [ktor-serialization-jvm-3.0.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-serialization-jvm/3.0.3/ktor-serialization-jvm-3.0.3.jar) | jar, sources | — |
| `io.ktor:ktor-serialization-kotlinx-json-jvm:3.0.3` | 3.0.3 | [ktor-serialization-kotlinx-json-jvm-3...](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-serialization-kotlinx-json-jvm/3.0.3/ktor-serialization-kotlinx-json-jvm-3.0.3.jar) | jar, sources | — |
| `io.ktor:ktor-serialization-kotlinx-jvm:3.0.3` | 3.0.3 | [ktor-serialization-kotlinx-jvm-3.0.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-serialization-kotlinx-jvm/3.0.3/ktor-serialization-kotlinx-jvm-3.0.3.jar) | jar, sources | — |
| `io.ktor:ktor-sse-jvm:3.0.3` | 3.0.3 | [ktor-sse-jvm-3.0.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-sse-jvm/3.0.3/ktor-sse-jvm-3.0.3.jar) | jar, sources | — |
| `io.ktor:ktor-utils-jvm:3.0.3` | 3.0.3 | [ktor-utils-jvm-3.0.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-utils-jvm/3.0.3/ktor-utils-jvm-3.0.3.jar) | jar, sources | — |
| `io.ktor:ktor-websocket-serialization-jvm:3.0.3` | 3.0.3 | [ktor-websocket-serialization-jvm-3.0....](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-websocket-serialization-jvm/3.0.3/ktor-websocket-serialization-jvm-3.0.3.jar) | jar, sources | — |
| `io.ktor:ktor-websockets-jvm:3.0.3` | 3.0.3 | [ktor-websockets-jvm-3.0.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/ktor/ktor-websockets-jvm/3.0.3/ktor-websockets-jvm-3.0.3.jar) | jar, sources | — |
| `io.netty:netty-all:4.1.117.Final` | 4.1.117.Final | [netty-all-4.1.117.Final.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-all/4.1.117.Final/netty-all-4.1.117.Final.jar) | jar | 4.1.48.Final |
| `io.netty:netty-all:4.2.0.RC2` | 4.2.0.RC2 | [netty-all-4.2.0.RC2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-all/4.2.0.RC2/netty-all-4.2.0.RC2.jar) | jar | 4.1.48.Final |
| `io.netty:netty-buffer:4.1.117.Final` | 4.1.117.Final | [netty-buffer-4.1.117.Final.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-buffer/4.1.117.Final/netty-buffer-4.1.117.Final.jar) | jar, sources | 4.1.48.Final |
| `io.netty:netty-buffer:4.2.0.RC2` | 4.2.0.RC2 | [netty-buffer-4.2.0.RC2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-buffer/4.2.0.RC2/netty-buffer-4.2.0.RC2.jar) | jar, sources | 4.1.48.Final |
| `io.netty:netty-codec-base:4.2.0.RC2` | 4.2.0.RC2 | [netty-codec-base-4.2.0.RC2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-codec-base/4.2.0.RC2/netty-codec-base-4.2.0.RC2.jar) | jar, sources | — |
| `io.netty:netty-codec-http2:4.2.0.RC2` | 4.2.0.RC2 | [netty-codec-http2-4.2.0.RC2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-codec-http2/4.2.0.RC2/netty-codec-http2-4.2.0.RC2.jar) | jar, sources | 4.1.48.Final |
| `io.netty:netty-codec-http:4.1.117.Final` | 4.1.117.Final | [netty-codec-http-4.1.117.Final.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-codec-http/4.1.117.Final/netty-codec-http-4.1.117.Final.jar) | jar, sources | 4.1.48.Final |
| `io.netty:netty-codec-http:4.2.0.RC2` | 4.2.0.RC2 | [netty-codec-http-4.2.0.RC2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-codec-http/4.2.0.RC2/netty-codec-http-4.2.0.RC2.jar) | jar, sources | 4.1.48.Final |
| `io.netty:netty-codec:4.1.117.Final` | 4.1.117.Final | [netty-codec-4.1.117.Final.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-codec/4.1.117.Final/netty-codec-4.1.117.Final.jar) | jar, sources | 4.1.48.Final |
| `io.netty:netty-codec:4.2.0.RC2` | 4.2.0.RC2 | [netty-codec-4.2.0.RC2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-codec/4.2.0.RC2/netty-codec-4.2.0.RC2.jar) | jar, sources | 4.1.48.Final |
| `io.netty:netty-common:4.1.117.Final` | 4.1.117.Final | [netty-common-4.1.117.Final.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-common/4.1.117.Final/netty-common-4.1.117.Final.jar) | jar, sources | 4.1.48.Final |
| `io.netty:netty-common:4.2.0.RC2` | 4.2.0.RC2 | [netty-common-4.2.0.RC2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-common/4.2.0.RC2/netty-common-4.2.0.RC2.jar) | jar, sources | 4.1.48.Final |
| `io.netty:netty-handler-ssl-ocsp:4.2.0.RC2` | 4.2.0.RC2 | [netty-handler-ssl-ocsp-4.2.0.RC2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-handler-ssl-ocsp/4.2.0.RC2/netty-handler-ssl-ocsp-4.2.0.RC2.jar) | jar, sources | — |
| `io.netty:netty-handler:4.1.117.Final` | 4.1.117.Final | [netty-handler-4.1.117.Final.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-handler/4.1.117.Final/netty-handler-4.1.117.Final.jar) | jar, sources | 4.1.48.Final |
| `io.netty:netty-handler:4.2.0.RC2` | 4.2.0.RC2 | [netty-handler-4.2.0.RC2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-handler/4.2.0.RC2/netty-handler-4.2.0.RC2.jar) | jar, sources | 4.1.48.Final |
| `io.netty:netty-pkitesting:4.2.0.RC2` | 4.2.0.RC2 | [netty-pkitesting-4.2.0.RC2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-pkitesting/4.2.0.RC2/netty-pkitesting-4.2.0.RC2.jar) | jar, sources | — |
| `io.netty:netty-resolver:4.1.117.Final` | 4.1.117.Final | [netty-resolver-4.1.117.Final.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-resolver/4.1.117.Final/netty-resolver-4.1.117.Final.jar) | jar, sources | 4.1.48.Final |
| `io.netty:netty-resolver:4.2.0.RC2` | 4.2.0.RC2 | [netty-resolver-4.2.0.RC2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-resolver/4.2.0.RC2/netty-resolver-4.2.0.RC2.jar) | jar, sources | 4.1.48.Final |
| `io.netty:netty-transport-classes-epoll:4.2.0.RC2` | 4.2.0.RC2 | [netty-transport-classes-epoll-4.2.0.R...](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-transport-classes-epoll/4.2.0.RC2/netty-transport-classes-epoll-4.2.0.RC2.jar) | jar, sources | — |
| `io.netty:netty-transport-classes-kqueue:4.2.0.RC2` | 4.2.0.RC2 | [netty-transport-classes-kqueue-4.2.0....](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-transport-classes-kqueue/4.2.0.RC2/netty-transport-classes-kqueue-4.2.0.RC2.jar) | jar, sources | — |
| `io.netty:netty-transport:4.1.117.Final` | 4.1.117.Final | [netty-transport-4.1.117.Final.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-transport/4.1.117.Final/netty-transport-4.1.117.Final.jar) | jar, sources | 4.1.48.Final |
| `io.netty:netty-transport:4.2.0.RC2` | 4.2.0.RC2 | [netty-transport-4.2.0.RC2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-transport/4.2.0.RC2/netty-transport-4.2.0.RC2.jar) | jar, sources | 4.1.48.Final |
| `io.opentelemetry:opentelemetry-api:1.47.0` | 1.47.0 | [opentelemetry-api-1.47.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/opentelemetry/opentelemetry-api/1.47.0/opentelemetry-api-1.47.0.jar) | jar, sources | — |
| `io.opentelemetry:opentelemetry-context:1.47.0` | 1.47.0 | [opentelemetry-context-1.47.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/opentelemetry/opentelemetry-context/1.47.0/opentelemetry-context-1.47.0.jar) | jar, sources | — |
| `io.opentelemetry:opentelemetry-extension-kotlin:1.47.0` | 1.47.0 | [opentelemetry-extension-kotlin-1.47.0...](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/opentelemetry/opentelemetry-extension-kotlin/1.47.0/opentelemetry-extension-kotlin-1.47.0.jar) | jar, sources | — |
| `javax.annotation:javax.annotation-api:1.3.2` | 1.3.2 | [javax.annotation-api-1.3.2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/javax/annotation/javax.annotation-api/1.3.2/javax.annotation-api-1.3.2.jar) | jar, sources | — |
| `javax.xml.bind:jaxb-api:2.3.1` | 2.3.1 | [jaxb-api-2.3.1.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/javax/xml/bind/jaxb-api/2.3.1/jaxb-api-2.3.1.jar) | jar, sources | 2.3.1 |
| `jaxen:jaxen:1.2.0` | 1.2.0 | [jaxen-1.2.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/jaxen/jaxen/1.2.0/jaxen-1.2.0.jar) | jar, sources | 1.2.0 |
| `joda-time:joda-time:2.10.14` | 2.10.14 | [joda-time-2.10.14.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/joda-time/joda-time/2.10.14/joda-time-2.10.14.jar) | jar, sources | 2.14.1 |
| `junit:junit:4.13.2` | 4.13.2 | [junit-4.13.2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/junit/junit/4.13.2/junit-4.13.2.jar) | jar, sources | — |
| `net.jcip:jcip-annotations:1.0` | 1.0 | [jcip-annotations-1.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/net/jcip/jcip-annotations/1.0/jcip-annotations-1.0.jar) | jar, sources | 1.0 |
| `org.apache.ant:ant-launcher:1.7.1` | 1.7.1 | [ant-launcher-1.7.1.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/ant/ant-launcher/1.7.1/ant-launcher-1.7.1.jar) | jar | 1.10.17 |
| `org.apache.ant:ant:1.7.1` | 1.7.1 | [ant-1.7.1.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/ant/ant/1.7.1/ant-1.7.1.jar) | jar, sources | 1.10.17 |
| `org.apache.arrow:arrow-algorithm:18.2.0` | 18.2.0 | [arrow-algorithm-18.2.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/arrow/arrow-algorithm/18.2.0/arrow-algorithm-18.2.0.jar) | jar, sources | — |
| `org.apache.arrow:arrow-format:18.2.0` | 18.2.0 | [arrow-format-18.2.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/arrow/arrow-format/18.2.0/arrow-format-18.2.0.jar) | jar, sources | — |
| `org.apache.arrow:arrow-memory-core:18.2.0` | 18.2.0 | [arrow-memory-core-18.2.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/arrow/arrow-memory-core/18.2.0/arrow-memory-core-18.2.0.jar) | jar, sources | — |
| `org.apache.arrow:arrow-memory-netty-buffer-patch:18.2.0` | 18.2.0 | [arrow-memory-netty-buffer-patch-18.2....](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/arrow/arrow-memory-netty-buffer-patch/18.2.0/arrow-memory-netty-buffer-patch-18.2.0.jar) | jar, sources | — |
| `org.apache.arrow:arrow-memory-netty:18.2.0` | 18.2.0 | [arrow-memory-netty-18.2.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/arrow/arrow-memory-netty/18.2.0/arrow-memory-netty-18.2.0.jar) | jar, sources | — |
| `org.apache.arrow:arrow-vector:18.2.0` | 18.2.0 | [arrow-vector-18.2.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/arrow/arrow-vector/18.2.0/arrow-vector-18.2.0.jar) | jar, sources | — |
| `org.apache.commons:commons-compress:1.26.1` | 1.26.1 | [commons-compress-1.26.1.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/commons/commons-compress/1.26.1/commons-compress-1.26.1.jar) | jar, sources | 1.27.1 |
| `org.apache.commons:commons-lang3:3.17.0` | 3.17.0 | [commons-lang3-3.17.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/commons/commons-lang3/3.17.0/commons-lang3-3.17.0.jar) | jar, sources | 3.20.0 |
| `org.apache.httpcomponents:httpclient:4.5.14` | 4.5.14 | [httpclient-4.5.14.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/httpcomponents/httpclient/4.5.14/httpclient-4.5.14.jar) | jar, sources | 4.5.14 |
| `org.apache.httpcomponents:httpcore:4.4.16` | 4.4.16 | [httpcore-4.4.16.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/httpcomponents/httpcore/4.4.16/httpcore-4.4.16.jar) | jar, sources | 4.4.16 |
| `org.apache.httpcomponents:httpmime:4.5.14` | 4.5.14 | [httpmime-4.5.14.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/httpcomponents/httpmime/4.5.14/httpmime-4.5.14.jar) | jar, sources | 4.5.14 |
| `org.apache.maven.resolver:maven-resolver-api:1.9.22` | 1.9.22 | [maven-resolver-api-1.9.22.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/maven/resolver/maven-resolver-api/1.9.22/maven-resolver-api-1.9.22.jar) | jar, sources | 1.9.25 |
| `org.apache.maven.resolver:maven-resolver-connector-basic:1.9.22` | 1.9.22 | [maven-resolver-connector-basic-1.9.22...](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/maven/resolver/maven-resolver-connector-basic/1.9.22/maven-resolver-connector-basic-1.9.22.jar) | jar, sources | 1.9.25 |
| `org.apache.maven.resolver:maven-resolver-impl:1.9.22` | 1.9.22 | [maven-resolver-impl-1.9.22.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/maven/resolver/maven-resolver-impl/1.9.22/maven-resolver-impl-1.9.22.jar) | jar, sources | 1.9.25 |
| `org.apache.maven.resolver:maven-resolver-named-locks:1.9.22` | 1.9.22 | [maven-resolver-named-locks-1.9.22.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/maven/resolver/maven-resolver-named-locks/1.9.22/maven-resolver-named-locks-1.9.22.jar) | jar, sources | 1.9.25 |
| `org.apache.maven.resolver:maven-resolver-spi:1.9.22` | 1.9.22 | [maven-resolver-spi-1.9.22.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/maven/resolver/maven-resolver-spi/1.9.22/maven-resolver-spi-1.9.22.jar) | jar, sources | 1.9.25 |
| `org.apache.maven.resolver:maven-resolver-transport-file:1.9.22` | 1.9.22 | [maven-resolver-transport-file-1.9.22.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/maven/resolver/maven-resolver-transport-file/1.9.22/maven-resolver-transport-file-1.9.22.jar) | jar, sources | 1.9.25 |
| `org.apache.maven.resolver:maven-resolver-transport-http:1.9.22` | 1.9.22 | [maven-resolver-transport-http-1.9.22.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/maven/resolver/maven-resolver-transport-http/1.9.22/maven-resolver-transport-http-1.9.22.jar) | jar, sources | 1.9.25 |
| `org.apache.maven.resolver:maven-resolver-util:1.9.22` | 1.9.22 | [maven-resolver-util-1.9.22.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/maven/resolver/maven-resolver-util/1.9.22/maven-resolver-util-1.9.22.jar) | jar, sources | 1.9.25 |
| `org.apache.maven:maven-artifact:3.9.9` | 3.9.9 | [maven-artifact-3.9.9.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/maven/maven-artifact/3.9.9/maven-artifact-3.9.9.jar) | jar, sources | — |
| `org.apache.maven:maven-builder-support:3.9.9` | 3.9.9 | [maven-builder-support-3.9.9.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/maven/maven-builder-support/3.9.9/maven-builder-support-3.9.9.jar) | jar, sources | — |
| `org.apache.maven:maven-model-builder:3.9.9` | 3.9.9 | [maven-model-builder-3.9.9.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/maven/maven-model-builder/3.9.9/maven-model-builder-3.9.9.jar) | jar, sources | — |
| `org.apache.maven:maven-model:3.9.9` | 3.9.9 | [maven-model-3.9.9.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/maven/maven-model/3.9.9/maven-model-3.9.9.jar) | jar, sources | — |
| `org.apache.maven:maven-repository-metadata:3.9.9` | 3.9.9 | [maven-repository-metadata-3.9.9.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/maven/maven-repository-metadata/3.9.9/maven-repository-metadata-3.9.9.jar) | jar, sources | — |
| `org.apache.maven:maven-resolver-provider:3.9.9` | 3.9.9 | [maven-resolver-provider-3.9.9.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apache/maven/maven-resolver-provider/3.9.9/maven-resolver-provider-3.9.9.jar) | jar, sources | — |
| `org.apiguardian:apiguardian-api:1.1.2` | 1.1.2 | [apiguardian-api-1.1.2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/apiguardian/apiguardian-api/1.1.2/apiguardian-api-1.1.2.jar) | jar, sources | 1.1.2 |
| `org.atteo:evo-inflector:1.3` | 1.3 | [evo-inflector-1.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/atteo/evo-inflector/1.3/evo-inflector-1.3.jar) | jar, sources | — |
| `org.bouncycastle:bcpkix-jdk18on:1.79` | 1.79 | [bcpkix-jdk18on-1.79.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/bouncycastle/bcpkix-jdk18on/1.79/bcpkix-jdk18on-1.79.jar) | jar, sources | debian |
| `org.bouncycastle:bcpkix-jdk18on:1.80` | 1.80 | [bcpkix-jdk18on-1.80.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/bouncycastle/bcpkix-jdk18on/1.80/bcpkix-jdk18on-1.80.jar) | jar, sources | debian |
| `org.bouncycastle:bcprov-jdk18on:1.79` | 1.79 | [bcprov-jdk18on-1.79.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/bouncycastle/bcprov-jdk18on/1.79/bcprov-jdk18on-1.79.jar) | jar, sources | debian |
| `org.bouncycastle:bcprov-jdk18on:1.80` | 1.80 | [bcprov-jdk18on-1.80.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/bouncycastle/bcprov-jdk18on/1.80/bcprov-jdk18on-1.80.jar) | jar, sources | debian |
| `org.bouncycastle:bcutil-jdk18on:1.79` | 1.79 | [bcutil-jdk18on-1.79.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/bouncycastle/bcutil-jdk18on/1.79/bcutil-jdk18on-1.79.jar) | jar, sources | debian |
| `org.bouncycastle:bcutil-jdk18on:1.80` | 1.80 | [bcutil-jdk18on-1.80.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/bouncycastle/bcutil-jdk18on/1.80/bcutil-jdk18on-1.80.jar) | jar, sources | debian |
| `org.codehaus.groovy:groovy:3.0.19` | 3.0.19 | [groovy-3.0.19.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/codehaus/groovy/groovy/3.0.19/groovy-3.0.19.jar) | jar, sources | 2.4.21 |
| `org.codehaus.plexus:plexus-interpolation:1.27` | 1.27 | [plexus-interpolation-1.27.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/codehaus/plexus/plexus-interpolation/1.27/plexus-interpolation-1.27.jar) | jar, sources | 1.27 |
| `org.codehaus.plexus:plexus-utils:3.5.1` | 3.5.1 | [plexus-utils-3.5.1.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/codehaus/plexus/plexus-utils/3.5.1/plexus-utils-3.5.1.jar) | jar, sources | 3.4.2 |
| `org.codehaus.woodstox:stax2-api:4.2.2` | 4.2.2 | [stax2-api-4.2.2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/codehaus/woodstox/stax2-api/4.2.2/stax2-api-4.2.2.jar) | jar, sources | 4.1 |
| `org.eclipse.sisu:org.eclipse.sisu.inject:0.9.0.M3` | 0.9.0.M3 | [org.eclipse.sisu.inject-0.9.0.M3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/eclipse/sisu/org.eclipse.sisu.inject/0.9.0.M3/org.eclipse.sisu.inject-0.9.0.M3.jar) | jar, sources | 0.3.5 |
| `org.glassfish.jaxb:jaxb-runtime:2.3.9` | 2.3.9 | [jaxb-runtime-2.3.9.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/glassfish/jaxb/jaxb-runtime/2.3.9/jaxb-runtime-2.3.9.jar) | jar, sources | 2.3.0.1 |
| `org.glassfish.jaxb:txw2:2.3.9` | 2.3.9 | [txw2-2.3.9.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/glassfish/jaxb/txw2/2.3.9/txw2-2.3.9.jar) | jar, sources | 2.3.0.1 |
| `org.hamcrest:hamcrest-core:1.3` | 1.3 | [hamcrest-core-1.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar) | jar, sources | debian |
| `org.hdrhistogram:HdrHistogram:2.2.2` | 2.2.2 | [HdrHistogram-2.2.2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/hdrhistogram/HdrHistogram/2.2.2/HdrHistogram-2.2.2.jar) | jar, sources | 2.2.2 |
| `org.jdom:jdom2:2.0.6.1` | 2.0.6.1 | [jdom2-2.0.6.1.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jdom/jdom2/2.0.6.1/jdom2-2.0.6.1.jar) | jar, sources | 2.0.5 |
| `org.jetbrains.intellij.deps.fastutil:intellij-deps-fastutil:8.5.14-jb1` | 8.5.14-jb1 | [intellij-deps-fastutil-8.5.14-jb1.jar](https://cache-redirector.jetbrains.com/packages.jetbrains.team/maven/p/ij/intellij-dependencies/org/jetbrains/intellij/deps/fastutil/intellij-deps-fastutil/8.5.14-jb1/intellij-deps-fastutil-8.5.14-jb1.jar) | jar, sources | — |
| `org.jetbrains.intellij.deps:asm-all:9.6.1` | 9.6.1 | [asm-all-9.6.1.jar](https://cache-redirector.jetbrains.com/packages.jetbrains.team/maven/p/ij/intellij-dependencies/org/jetbrains/intellij/deps/asm-all/9.6.1/asm-all-9.6.1.jar) | jar, sources | — |
| `org.jetbrains.intellij.plugins:structure-base:3.276` | 3.276 | [structure-base-3.276.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/intellij/plugins/structure-base/3.276/structure-base-3.276.jar) | jar, sources | — |
| `org.jetbrains.intellij.plugins:structure-intellij:3.276` | 3.276 | [structure-intellij-3.276.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/intellij/plugins/structure-intellij/3.276/structure-intellij-3.276.jar) | jar, sources | — |
| `org.jetbrains.intellij:blockmap:1.0.7` | 1.0.7 | [blockmap-1.0.7.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/intellij/blockmap/1.0.7/blockmap-1.0.7.jar) | jar, sources | — |
| `org.jetbrains.jps:jps-javac-extension:10` | 10 | [jps-javac-extension-10.jar](https://cache-redirector.jetbrains.com/packages.jetbrains.team/maven/p/ij/intellij-dependencies/org/jetbrains/jps/jps-javac-extension/10/jps-javac-extension-10.jar) | jar | — |
| `org.jetbrains.kotlin:kotlin-build-tools-api:2.1.20-Beta2` | 2.1.20-Beta2 | [kotlin-build-tools-api-2.1.20-Beta2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-build-tools-api/2.1.20-Beta2/kotlin-build-tools-api-2.1.20-Beta2.jar) | jar, sources | — |
| `org.jetbrains.kotlin:kotlin-compiler:2.1.20-Beta2` | 2.1.20-Beta2 | [kotlin-compiler-2.1.20-Beta2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-compiler/2.1.20-Beta2/kotlin-compiler-2.1.20-Beta2.jar) | jar, sources | 1.3.31 |
| `org.jetbrains.kotlin:kotlin-compose-compiler-plugin:2.1.20-Beta2` | 2.1.20-Beta2 | [kotlin-compose-compiler-plugin-2.1.20...](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-compose-compiler-plugin/2.1.20-Beta2/kotlin-compose-compiler-plugin-2.1.20-Beta2.jar) | jar, sources | — |
| `org.jetbrains.kotlin:kotlin-jps-plugin:2.1.20-Beta2` | 2.1.20-Beta2 | [kotlin-jps-plugin-2.1.20-Beta2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-jps-plugin/2.1.20-Beta2/kotlin-jps-plugin-2.1.20-Beta2.jar) | jar, sources | — |
| `org.jetbrains.kotlin:kotlin-metadata-jvm:2.1.20-Beta2` | 2.1.20-Beta2 | [kotlin-metadata-jvm-2.1.20-Beta2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-metadata-jvm/2.1.20-Beta2/kotlin-metadata-jvm-2.1.20-Beta2.jar) | jar, sources | — |
| `org.jetbrains.kotlin:kotlin-reflect:2.1.10` | 2.1.10 | [kotlin-reflect-2.1.10.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-reflect/2.1.10/kotlin-reflect-2.1.10.jar) | jar, sources | 1.3.31 |
| `org.jetbrains.kotlin:kotlin-serialization-compiler-plugin:2.1.20-Beta2` | 2.1.20-Beta2 | [kotlin-serialization-compiler-plugin-...](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-serialization-compiler-plugin/2.1.20-Beta2/kotlin-serialization-compiler-plugin-2.1.20-Beta2.jar) | jar, sources | — |
| `org.jetbrains.kotlin:kotlin-stdlib:2.1.10` | 2.1.10 | [kotlin-stdlib-2.1.10.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-stdlib/2.1.10/kotlin-stdlib-2.1.10.jar) | jar, sources | 1.3.31 |
| `org.jetbrains.kotlin:kotlin-util-klib-metadata:2.1.20-Beta2` | 2.1.20-Beta2 | [kotlin-util-klib-metadata-2.1.20-Beta...](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-util-klib-metadata/2.1.20-Beta2/kotlin-util-klib-metadata-2.1.20-Beta2.jar) | jar, sources | — |
| `org.jetbrains.kotlin:kotlin-util-klib:2.1.20-Beta2` | 2.1.20-Beta2 | [kotlin-util-klib-2.1.20-Beta2.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-util-klib/2.1.20-Beta2/kotlin-util-klib-2.1.20-Beta2.jar) | jar, sources | — |
| `org.jetbrains.kotlinx:kotlinx-collections-immutable-jvm:0.3.8` | 0.3.8 | [kotlinx-collections-immutable-jvm-0.3...](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlinx/kotlinx-collections-immutable-jvm/0.3.8/kotlinx-collections-immutable-jvm-0.3.8.jar) | jar, sources | — |
| `org.jetbrains.kotlinx:kotlinx-io-bytestring-jvm:0.5.4` | 0.5.4 | [kotlinx-io-bytestring-jvm-0.5.4.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlinx/kotlinx-io-bytestring-jvm/0.5.4/kotlinx-io-bytestring-jvm-0.5.4.jar) | jar, sources | — |
| `org.jetbrains.kotlinx:kotlinx-io-core-jvm:0.5.4` | 0.5.4 | [kotlinx-io-core-jvm-0.5.4.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlinx/kotlinx-io-core-jvm/0.5.4/kotlinx-io-core-jvm-0.5.4.jar) | jar, sources | — |
| `org.jetbrains.kotlinx:kotlinx-serialization-core-jvm:1.7.3` | 1.7.3 | [kotlinx-serialization-core-jvm-1.7.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlinx/kotlinx-serialization-core-jvm/1.7.3/kotlinx-serialization-core-jvm-1.7.3.jar) | jar, sources | — |
| `org.jetbrains.kotlinx:kotlinx-serialization-json-io-jvm:1.7.3` | 1.7.3 | [kotlinx-serialization-json-io-jvm-1.7...](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlinx/kotlinx-serialization-json-io-jvm/1.7.3/kotlinx-serialization-json-io-jvm-1.7.3.jar) | jar, sources | — |
| `org.jetbrains.kotlinx:kotlinx-serialization-json-jvm:1.7.3` | 1.7.3 | [kotlinx-serialization-json-jvm-1.7.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlinx/kotlinx-serialization-json-jvm/1.7.3/kotlinx-serialization-json-jvm-1.7.3.jar) | jar, sources | — |
| `org.jetbrains.kotlinx:kotlinx-serialization-protobuf-jvm:1.7.3` | 1.7.3 | [kotlinx-serialization-protobuf-jvm-1....](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/kotlinx/kotlinx-serialization-protobuf-jvm/1.7.3/kotlinx-serialization-protobuf-jvm-1.7.3.jar) | jar, sources | — |
| `org.jetbrains.teamcity:serviceMessages:2024.07` | 2024.07 | [serviceMessages-2024.07.jar](https://cache-redirector.jetbrains.com/download.jetbrains.com/teamcity-repository/org/jetbrains/teamcity/serviceMessages/2024.07/serviceMessages-2024.07.jar) | jar, sources | — |
| `org.jetbrains.testDiscovery:test-discovery-plugin-base:0.1.191` | 0.1.191 | [test-discovery-plugin-base-0.1.191.jar](https://cache-redirector.jetbrains.com/packages.jetbrains.team/maven/p/ij/intellij-dependencies/org/jetbrains/testDiscovery/test-discovery-plugin-base/0.1.191/test-discovery-plugin-base-0.1.191.jar) | jar, sources | — |
| `org.jetbrains:annotations-java5:24.0.0` | 24.0.0 | [annotations-java5-24.0.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/annotations-java5/24.0.0/annotations-java5-24.0.0.jar) | jar, sources | — |
| `org.jetbrains:annotations:24.0.0` | 24.0.0 | [annotations-24.0.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jetbrains/annotations/24.0.0/annotations-24.0.0.jar) | jar, sources | 23.0.0-SNAPSHOT |
| `org.jetbrains:apple-notary-api-kotlin-client:2.0.1` | 2.0.1 | [apple-notary-api-kotlin-client-2.0.1.jar](https://cache-redirector.jetbrains.com/packages.jetbrains.team/maven/p/ij/intellij-dependencies/org/jetbrains/apple-notary-api-kotlin-client/2.0.1/apple-notary-api-kotlin-client-2.0.1.jar) | jar, sources | — |
| `org.jsoup:jsoup:1.18.3` | 1.18.3 | [jsoup-1.18.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/jsoup/jsoup/1.18.3/jsoup-1.18.3.jar) | jar, sources | 1.15.3 |
| `org.junit.jupiter:junit-jupiter-api:5.11.3` | 5.11.3 | [junit-jupiter-api-5.11.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/junit/jupiter/junit-jupiter-api/5.11.3/junit-jupiter-api-5.11.3.jar) | jar, sources | 5.14.2 |
| `org.junit.jupiter:junit-jupiter-engine:5.11.3` | 5.11.3 | [junit-jupiter-engine-5.11.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/junit/jupiter/junit-jupiter-engine/5.11.3/junit-jupiter-engine-5.11.3.jar) | jar, sources | 5.14.2 |
| `org.junit.platform:junit-platform-commons:1.11.3` | 1.11.3 | [junit-platform-commons-1.11.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/junit/platform/junit-platform-commons/1.11.3/junit-platform-commons-1.11.3.jar) | jar, sources | 1.14.2 |
| `org.junit.platform:junit-platform-engine:1.11.3` | 1.11.3 | [junit-platform-engine-1.11.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/junit/platform/junit-platform-engine/1.11.3/junit-platform-engine-1.11.3.jar) | jar, sources | 1.14.2 |
| `org.junit.platform:junit-platform-launcher:1.11.3` | 1.11.3 | [junit-platform-launcher-1.11.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/junit/platform/junit-platform-launcher/1.11.3/junit-platform-launcher-1.11.3.jar) | jar, sources | 1.14.2 |
| `org.junit.vintage:junit-vintage-engine:5.11.3` | 5.11.3 | [junit-vintage-engine-5.11.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/junit/vintage/junit-vintage-engine/5.11.3/junit-vintage-engine-5.11.3.jar) | jar, sources | 5.14.2 |
| `org.opentest4j:opentest4j:1.3.0` | 1.3.0 | [opentest4j-1.3.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/opentest4j/opentest4j/1.3.0/opentest4j-1.3.0.jar) | jar, sources | 1.2.0 |
| `org.slf4j:log4j-over-slf4j:1.7.36` | 1.7.36 | [log4j-over-slf4j-1.7.36.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/slf4j/log4j-over-slf4j/1.7.36/log4j-over-slf4j-1.7.36.jar) | jar, sources | 1.7.32 |
| `org.slf4j:slf4j-api:2.0.13` | 2.0.13 | [slf4j-api-2.0.13.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/slf4j/slf4j-api/2.0.13/slf4j-api-2.0.13.jar) | jar, sources | 1.7.32 |
| `org.slf4j:slf4j-jdk14:2.0.13` | 2.0.13 | [slf4j-jdk14-2.0.13.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/slf4j/slf4j-jdk14/2.0.13/slf4j-jdk14-2.0.13.jar) | jar, sources | 1.7.32 |
| `org.spdx:java-spdx-library:1.1.10` | 1.1.10 | [java-spdx-library-1.1.10.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/spdx/java-spdx-library/1.1.10/java-spdx-library-1.1.10.jar) | jar, sources | — |
| `org.spdx:spdx-jackson-store:1.1.9` | 1.1.9 | [spdx-jackson-store-1.1.9.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/spdx/spdx-jackson-store/1.1.9/spdx-jackson-store-1.1.9.jar) | jar, sources | — |
| `org.spdx:tools-java:1.1.8` | 1.1.8 | [tools-java-1.1.8.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/spdx/tools-java/1.1.8/tools-java-1.1.8.jar) | jar, sources | — |
| `org.yaml:snakeyaml:2.3` | 2.3 | [snakeyaml-2.3.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/yaml/snakeyaml/2.3/snakeyaml-2.3.jar) | jar, sources | — |
| `oro:oro:2.0.8` | 2.0.8 | [oro-2.0.8.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/oro/oro/2.0.8/oro-2.0.8.jar) | jar, sources | 2.0.8 |

## Native Dependencies

| Maven Coordinate | Version | Upstream URL | Classifiers |
|---|---|---|---|
| `com.github.luben:zstd-jni:1.5.6-9` | 1.5.6-9 | [zstd-jni-1.5.6-9.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/com/github/luben/zstd-jni/1.5.6-9/zstd-jni-1.5.6-9.jar) | jar, sources |
| `io.netty:netty-tcnative-boringssl-static:2.0.69.Final` | 2.0.69.Final | [netty-tcnative-boringssl-static-2.0.6...](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-tcnative-boringssl-static/2.0.69.Final/netty-tcnative-boringssl-static-2.0.69.Final.jar) | jar, linux-aarch_64, linux-x86_64, osx-aarch_64, osx-x86_64, windows-x86_64, sources |
| `io.netty:netty-tcnative-classes:2.0.69.Final` | 2.0.69.Final | [netty-tcnative-classes-2.0.69.Final.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-tcnative-classes/2.0.69.Final/netty-tcnative-classes-2.0.69.Final.jar) | jar, sources |
| `io.netty:netty-transport-native-epoll:4.2.0.RC2` | 4.2.0.RC2 | [netty-transport-native-epoll-4.2.0.RC...](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-transport-native-epoll/4.2.0.RC2/netty-transport-native-epoll-4.2.0.RC2-linux-x86_64.jar) | linux-aarch_64, linux-riscv64, linux-x86_64, sources |
| `io.netty:netty-transport-native-kqueue:4.2.0.RC2` | 4.2.0.RC2 | [netty-transport-native-kqueue-4.2.0.R...](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-transport-native-kqueue/4.2.0.RC2/netty-transport-native-kqueue-4.2.0.RC2-osx-x86_64.jar) | osx-aarch_64, osx-x86_64, sources |
| `io.netty:netty-transport-native-unix-common:4.2.0.RC2` | 4.2.0.RC2 | [netty-transport-native-unix-common-4....](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/io/netty/netty-transport-native-unix-common/4.2.0.RC2/netty-transport-native-unix-common-4.2.0.RC2.jar) | jar, sources |
| `net.java.dev.jna:jna-platform:5.14.0` | 5.14.0 | [jna-platform-5.14.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/net/java/dev/jna/jna-platform/5.14.0/jna-platform-5.14.0.jar) | jar, sources |
| `net.java.dev.jna:jna:5.14.0` | 5.14.0 | [jna-5.14.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/net/java/dev/jna/jna/5.14.0/jna-5.14.0.jar) | jar, sources |
| `org.lz4:lz4-java:1.8.0` | 1.8.0 | [lz4-java-1.8.0.jar](https://cache-redirector.jetbrains.com/repo1.maven.org/maven2/org/lz4/lz4-java/1.8.0/lz4-java-1.8.0.jar) | jar, sources |

## Non-Maven Build Dependency

- **Name:** `jps-standalone_http`
- **URL:** https://packages.jetbrains.team/files/p/ij/intellij-build-dependencies/jps/jps-build-standalone-19.02.25.jar
- **Version:** 19.02.25

## Toolchain Dependencies (Binary)

These Bazel-fetched toolchain dependencies contain ELF executable or shared-library files.

| Cache Directory | Type | ELF Binaries Found |
|---|---|---|
| `rules_java++toolchains+remote_java_tools_linux` | Java build tools (linux-x86_64) | `java_tools/turbine_direct_graal`, `java_tools/ijar/ijar`, `java_tools/ijar/zipper`, `java_tools/src/tools/singlejar/singlejar_local`, `java_tools/src/tools/one_version/one_version_main` |
| `rules_java++toolchains+remotejdk21_linux` | Remote JDK 21 (linux-x86_64) | `bin/java`, `bin/javac`, `bin/jar`, `lib/server/libjvm.so`, `lib/jspawnhelper` (+ 66 more) |
| `rules_python++python+python_3_11_x86_64-unknown-linux-gnu` | Python 3.11 interpreter (x86_64-linux-gnu) | `lib/python3.11/lib-dynload/_testclinic.cpython-311-x86_64-linux-gnu.so`, `lib/python3.11/lib-dynload/_crypt.cpython-311-x86_64-linux-gnu.so`, `lib/libpython3.so`, `lib/libpython3.11.so.1.0`, `bin/python3.11` |

## Toolchain Dependencies (Vendor / Source-Only)

These Bazel-fetched toolchain dependencies contain no ELF binaries; they are source archives, rule modules, or platform-independent definitions.

| Cache Directory | Type |
|---|---|
| `abseil-cpp+` | Abseil C++ library source |
| `bazel_features+` | Bazel features module |
| `bazel_skylib+` | Bazel skylib standard library |
| `platforms` | Bazel platforms module |
| `platforms+host_platform+host_platform` | Host platform constraint |
| `protobuf+` | Protocol Buffers source |
| `rules_cc+` | C/C++ rules |
| `rules_java+` | Java rules |
| `rules_java++toolchains+remote_java_tools` | Java build tools (platform-independent) |
| `rules_jvm_external+` | JVM external dependency rules |
| `rules_kotlin+` | Kotlin rules |
| `rules_kotlin++rules_kotlin_extensions+com_github_google_ksp` | KSP extension for Kotlin rules |
| `rules_kotlin++rules_kotlin_extensions+com_github_jetbrains_kotlin` | JetBrains Kotlin extension |
| `rules_kotlin++rules_kotlin_extensions+com_github_jetbrains_kotlin_git` | JetBrains Kotlin git extension |
| `rules_kotlin++rules_kotlin_extensions+kotlinx_serialization_core_jvm` | Kotlinx serialization core extension |
| `rules_kotlin++rules_kotlin_extensions+kotlinx_serialization_json` | Kotlinx serialization JSON extension |
| `rules_kotlin++rules_kotlin_extensions+kotlinx_serialization_json_jvm` | Kotlinx serialization JSON JVM extension |
| `rules_license+` | License rules |
| `rules_pkg+` | Packaging rules |
| `rules_proto+` | Protocol Buffer rules |
| `rules_python+` | Python rules |
| `rules_python++python+pythons_hub` | Python versions hub |
| `rules_shell+` | Shell rules |
| `toolchains_protoc+` | Protoc toolchains module |
| `toolchains_protoc++protoc+toolchains_protoc_hub` | Protoc toolchain hub |
| `zlib+` | zlib source |
