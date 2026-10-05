# IntelliJ Maven Artifact Tasks

Generated from `intellijDeps.md` by checking `/work/maven-repo`.

## Summary

- Java + Native Maven coordinates reviewed: **184**
- Existing (exact or compatible major): **95**
- Tasks (upgrade or package): **89**
  - Package new artifacts: **79**
  - Upgrade existing Debian packages: **10**

## Existing Dependencies

These artifacts are already present in the Debian Maven repo with the exact version or the same major version.

| Maven Coordinate | Required Version | Debian Versions | Status |
|---|---|---|---|
| `com.fasterxml.jackson.core:jackson-annotations:2.17.2` | 2.17.2 | 2.14.0, 2.x | Existing (same major) |
| `com.fasterxml.jackson.core:jackson-core:2.17.0` | 2.17.0 | 2.14.1, 2.x | Existing (same major) |
| `com.fasterxml.jackson.core:jackson-databind:2.17.2` | 2.17.2 | 2.14.0, 2.x | Existing (same major) |
| `com.fasterxml.jackson.dataformat:jackson-dataformat-xml:2.15.0` | 2.15.0 | 2.14.0, 2.x | Existing (same major) |
| `com.fasterxml.jackson.dataformat:jackson-dataformat-yaml:2.17.2` | 2.17.2 | 2.8.11, 2.x | Existing (same major) |
| `com.fasterxml.jackson.datatype:jackson-datatype-joda:2.17.2` | 2.17.2 | 2.12.1, debian | Existing (same major) |
| `com.fasterxml.jackson.jr:jackson-jr-objects:2.17.2` | 2.17.2 | 2.14.0, debian | Existing (same major) |
| `com.github.luben:zstd-jni:1.5.6-9` | 1.5.6-9 | 1.5.2-5, debian | Existing (same major) |
| `com.google.code.gson:gson:2.12.1` | 2.12.1 | 2.10.1, debian | Existing (same major) |
| `com.google.protobuf:protobuf-java:3.24.4-jb.2` | 3.24.4-jb.2 | 2.6.1, 2.x, 3.21.12, debian | Existing (same major) |
| `com.sun.activation:javax.activation:1.2.0` | 1.2.0 | 1.2.0, debian | Existing (exact) |
| `com.sun.istack:istack-commons-runtime:3.0.12` | 3.0.12 | 3.0.6, debian | Existing (same major) |
| `com.thoughtworks.qdox:qdox:2.2.0` | 2.2.0 | 1.12.1, 2.0.3, 2.x, debian | Existing (same major) |
| `commons-cli:commons-cli:1.9.0` | 1.9.0 | 1.6.0, debian | Existing (same major) |
| `commons-codec:commons-codec:1.17.1` | 1.17.1 | 1.22.0, debian | Existing (same major) |
| `commons-io:commons-io:2.16.1` | 2.16.1 | 2.22.0, debian | Existing (same major) |
| `commons-logging:commons-logging:1.2` | 1.2 | 1.3.0, debian | Existing (same major) |
| `io.netty:netty-all:4.1.117.Final` | 4.1.117.Final | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-all:4.2.0.RC2` | 4.2.0.RC2 | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-buffer:4.1.117.Final` | 4.1.117.Final | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-buffer:4.2.0.RC2` | 4.2.0.RC2 | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-codec:4.1.117.Final` | 4.1.117.Final | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-codec:4.2.0.RC2` | 4.2.0.RC2 | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-codec-http:4.1.117.Final` | 4.1.117.Final | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-codec-http:4.2.0.RC2` | 4.2.0.RC2 | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-codec-http2:4.2.0.RC2` | 4.2.0.RC2 | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-common:4.1.117.Final` | 4.1.117.Final | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-common:4.2.0.RC2` | 4.2.0.RC2 | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-handler:4.1.117.Final` | 4.1.117.Final | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-handler:4.2.0.RC2` | 4.2.0.RC2 | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-resolver:4.1.117.Final` | 4.1.117.Final | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-resolver:4.2.0.RC2` | 4.2.0.RC2 | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-transport:4.1.117.Final` | 4.1.117.Final | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-transport:4.2.0.RC2` | 4.2.0.RC2 | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-transport-native-epoll:4.2.0.RC2` | 4.2.0.RC2 | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-transport-native-kqueue:4.2.0.RC2` | 4.2.0.RC2 | 4.1.48.Final, debian | Existing (same major) |
| `io.netty:netty-transport-native-unix-common:4.2.0.RC2` | 4.2.0.RC2 | 4.1.48.Final, debian | Existing (same major) |
| `javax.xml.bind:jaxb-api:2.3.1` | 2.3.1 | 2.3.1, debian | Existing (exact) |
| `jaxen:jaxen:1.2.0` | 1.2.0 | 1.2.0, debian | Existing (exact) |
| `joda-time:joda-time:2.10.14` | 2.10.14 | 2.14.1, debian | Existing (same major) |
| `junit:junit:4.13.2` | 4.13.2 | 3.8.2, 3.x, 4.13.2, 4.x | Existing (exact) |
| `net.java.dev.jna:jna:5.14.0` | 5.14.0 | 5.18.1, debian | Existing (same major) |
| `net.java.dev.jna:jna-platform:5.14.0` | 5.14.0 | 5.18.1, debian | Existing (same major) |
| `net.jcip:jcip-annotations:1.0` | 1.0 | 1.0, debian | Existing (exact) |
| `org.apache.ant:ant:1.7.1` | 1.7.1 | 1.10.17, debian | Existing (same major) |
| `org.apache.ant:ant-launcher:1.7.1` | 1.7.1 | 1.10.17, debian | Existing (same major) |
| `org.apache.commons:commons-compress:1.26.1` | 1.26.1 | 1.27.1, debian | Existing (same major) |
| `org.apache.commons:commons-lang3:3.17.0` | 3.17.0 | 3.20.0, 3.x, debian | Existing (same major) |
| `org.apache.httpcomponents:httpclient:4.5.14` | 4.5.14 | 4.5.14, debian | Existing (exact) |
| `org.apache.httpcomponents:httpcore:4.4.16` | 4.4.16 | 4.4.16, debian | Existing (exact) |
| `org.apache.httpcomponents:httpmime:4.5.14` | 4.5.14 | 4.5.14, debian | Existing (exact) |
| `org.apache.maven:maven-artifact:3.9.9` | 3.9.9 | 3.9.12, 3.x | Existing (same major) |
| `org.apache.maven:maven-builder-support:3.9.9` | 3.9.9 | 3.9.12, 3.x | Existing (same major) |
| `org.apache.maven:maven-model:3.9.9` | 3.9.9 | 3.9.12, 3.x | Existing (same major) |
| `org.apache.maven:maven-model-builder:3.9.9` | 3.9.9 | 3.9.12, 3.x | Existing (same major) |
| `org.apache.maven:maven-repository-metadata:3.9.9` | 3.9.9 | 3.9.12, 3.x | Existing (same major) |
| `org.apache.maven:maven-resolver-provider:3.9.9` | 3.9.9 | 3.9.12, 3.x | Existing (same major) |
| `org.apache.maven.resolver:maven-resolver-api:1.9.22` | 1.9.22 | 1.6.x, 1.9.25, debian | Existing (same major) |
| `org.apache.maven.resolver:maven-resolver-connector-basic:1.9.22` | 1.9.22 | 1.6.x, 1.9.25, debian | Existing (same major) |
| `org.apache.maven.resolver:maven-resolver-impl:1.9.22` | 1.9.22 | 1.6.x, 1.9.25, debian | Existing (same major) |
| `org.apache.maven.resolver:maven-resolver-named-locks:1.9.22` | 1.9.22 | 1.9.25, debian | Existing (same major) |
| `org.apache.maven.resolver:maven-resolver-spi:1.9.22` | 1.9.22 | 1.6.x, 1.9.25, debian | Existing (same major) |
| `org.apache.maven.resolver:maven-resolver-transport-file:1.9.22` | 1.9.22 | 1.6.x, 1.9.25, debian | Existing (same major) |
| `org.apache.maven.resolver:maven-resolver-transport-http:1.9.22` | 1.9.22 | 1.6.x, 1.9.25, debian | Existing (same major) |
| `org.apache.maven.resolver:maven-resolver-util:1.9.22` | 1.9.22 | 1.6.x, 1.9.25, debian | Existing (same major) |
| `org.apiguardian:apiguardian-api:1.1.2` | 1.1.2 | 1.1.2, debian | Existing (exact) |
| `org.bouncycastle:bcpkix-jdk18on:1.79` | 1.79 | debian | Existing (debian) |
| `org.bouncycastle:bcpkix-jdk18on:1.80` | 1.80 | debian | Existing (debian) |
| `org.bouncycastle:bcprov-jdk18on:1.79` | 1.79 | debian | Existing (debian) |
| `org.bouncycastle:bcprov-jdk18on:1.80` | 1.80 | debian | Existing (debian) |
| `org.bouncycastle:bcutil-jdk18on:1.79` | 1.79 | debian | Existing (debian) |
| `org.bouncycastle:bcutil-jdk18on:1.80` | 1.80 | debian | Existing (debian) |
| `org.codehaus.plexus:plexus-interpolation:1.27` | 1.27 | 1.27, debian | Existing (exact) |
| `org.codehaus.plexus:plexus-utils:3.5.1` | 3.5.1 | 2.x, 3.4.2, debian | Existing (same major) |
| `org.codehaus.woodstox:stax2-api:4.2.2` | 4.2.2 | 4.1, debian | Existing (same major) |
| `org.eclipse.sisu:org.eclipse.sisu.inject:0.9.0.M3` | 0.9.0.M3 | 0.3.5, debian | Existing (same major) |
| `org.glassfish.jaxb:jaxb-runtime:2.3.9` | 2.3.9 | 2.3.0.1, debian | Existing (same major) |
| `org.glassfish.jaxb:txw2:2.3.9` | 2.3.9 | 2.3.0.1, debian | Existing (same major) |
| `org.hamcrest:hamcrest-core:1.3` | 1.3 | debian | Existing (debian) |
| `org.hdrhistogram:HdrHistogram:2.2.2` | 2.2.2 | 2.2.2, debian | Existing (exact) |
| `org.jdom:jdom2:2.0.6.1` | 2.0.6.1 | 2.0.5, debian | Existing (same major) |
| `org.jsoup:jsoup:1.18.3` | 1.18.3 | 1.15.3, debian | Existing (same major) |
| `org.junit.jupiter:junit-jupiter-api:5.11.3` | 5.11.3 | 5.14.2, debian | Existing (same major) |
| `org.junit.jupiter:junit-jupiter-engine:5.11.3` | 5.11.3 | 5.14.2, debian | Existing (same major) |
| `org.junit.platform:junit-platform-commons:1.11.3` | 1.11.3 | 1.14.2, debian | Existing (same major) |
| `org.junit.platform:junit-platform-engine:1.11.3` | 1.11.3 | 1.14.2, debian | Existing (same major) |
| `org.junit.platform:junit-platform-launcher:1.11.3` | 1.11.3 | 1.14.2, debian | Existing (same major) |
| `org.junit.vintage:junit-vintage-engine:5.11.3` | 5.11.3 | 5.14.2, debian | Existing (same major) |
| `org.lz4:lz4-java:1.8.0` | 1.8.0 | 1.8.0, debian | Existing (exact) |
| `org.opentest4j:opentest4j:1.3.0` | 1.3.0 | 1.2.0, debian | Existing (same major) |
| `org.slf4j:log4j-over-slf4j:1.7.36` | 1.7.36 | 1.7.32, 2.0.17, 2.x, debian | Existing (same major) |
| `org.slf4j:slf4j-api:2.0.13` | 2.0.13 | 1.7.32, 2.0.17, 2.x, debian | Existing (same major) |
| `org.slf4j:slf4j-jdk14:2.0.13` | 2.0.13 | 1.7.32, 2.0.17, 2.x, debian | Existing (same major) |
| `org.yaml:snakeyaml:2.3` | 2.3 | 2.5, 2.x | Existing (same major) |
| `oro:oro:2.0.8` | 2.0.8 | 2.0.8, debian | Existing (exact) |

## Tasks

These artifacts need to be packaged or upgraded in Debian.

### Package `com.amazon.ion` artifacts
- **Upstream URL:** https://github.com/amazon-ion/ion-java
- **Build system:** Maven
- **Artifact:** `ion-java`
  - Required version: `1.11.9`
  - Action: **Package** - internal serializer

### Disable `com.auth0` artifacts
- **Upstream URL:** https://github.com/auth0/java-jwt
- **Build system:** Maven
- **Artifact:** `java-jwt`
  - Required version: `4.3.0`
  - Action: **Disable** - needed for apple notarizer

### Package `com.dynatrace.hash4j` artifacts
- **Upstream URL:** https://github.com/dynatrace-oss/hash4j
- **Build system:** Maven
- **Artifact:** `hash4j`
  - Required version: `0.20.0`
  - Action: **Package**

### Package `com.fasterxml.jackson.module` artifacts
- **Upstream URL:** https://github.com/FasterXML/jackson-module-kotlin
- **Build system:** Maven
- **Artifact:** `jackson-module-kotlin`
  - Required version: `2.17.2`
  - Action: **Package**

### Upgrade `com.github.ben-manes.caffeine` artifacts
- **Upstream URL:** https://github.com/ben-manes/caffeine
- **Build system:** Maven
- **Artifact:** `caffeine`
  - Required version: `3.2.0`
  - Debian versions: 2.6.2, debian
  - Action: **Upgrade**

### Package `com.github.spullara.cli-parser` artifacts
- **Upstream URL:** https://github.com/spullara/cli-parser
- **Build system:** Maven
- **Artifact:** `cli-parser`
  - Required version: `1.1.6`
  - Action: **Package** - cli parser for jps

### Package `com.google.flatbuffers` artifacts
- **Upstream URL:** https://github.com/google/flatbuffers
- **Build system:** Bazel/Maven
- **Artifact:** `flatbuffers-java`
  - Required version: `25.2.10`
  - Action: **Package**

### Package/Upgrade `com.google.guava` failureaccess artifacts
- **Upstream URL:** https://github.com/google/guava
- **Build system:** Maven
- **Artifact:** `failureaccess`
  - Required version: `1.0.2`
  - Action: **Package**

### Upgrade `com.google.protobuf` artifacts
- **Upstream URL:** https://github.com/protocolbuffers/protobuf
- **Build system:** Bazel
- **Artifact:** `protobuf-java`
  - Required version: `4.29.3`
  - Debian versions: 2.6.1, 2.x, 3.21.12, debian
  - Action: **Upgrade**

### Package `com.h2database` artifacts
- **Upstream URL:** https://github.com/h2database/h2database
- **Build system:** Maven
- **Artifact:** `h2-mvstore`
  - Required version: `2.3.232`
  - Action: **Package** - needed for jPS


### Package `com.jetbrains` artifacts
- **Upstream URL:** https://github.com/JetBrains/JetBrainsRuntime
- **Build system:** Unknown
- **Artifact:** `jbr-api`
  - Required version: `1.2.0`
  - Action: **Package**

### Exclude `com.jetbrains.format-ripper` artifacts
- **Upstream URL:** https://github.com/JetBrains/format-ripper
- **Build system:** Gradle
- **Artifact:** `format-ripper`
  - Required version: `1.1.1`
  - Action: **Exclude** - signature verification

### Exclude `com.jetbrains.intellij.devkit` artifacts
- **Upstream URL:** JetBrains IntelliJ DevKit (https://github.com/JetBrains/intellij-community)
- **Build system:** Gradle
- **Artifact:** `devkit-runtime-module-repository-jps`
  - Required version: `251.16369`
  - Action: **Package**

### Package `com.networknt` artifacts
- **Upstream URL:** https://github.com/networknt/json-schema-validator
- **Build system:** Maven
- **Artifact:** `json-schema-validator`
  - Required version: `1.3.1`
  - Action: **Package**

### Upgrade `com.squareup.okhttp3` artifacts
- **Upstream URL:** https://github.com/square/okhttp
- **Build system:** Gradle
- **Artifact:** `okhttp`
  - Required version: `4.12.0`
  - Debian versions: 3.13.1, debian
  - Action: **Upgrade**

### Package `com.squareup.okio` artifacts
- **Upstream URL:** https://github.com/square/okio
- **Build system:** Gradle
- **Artifact:** `okio-jvm`
  - Required version: `3.9.0`
  - Action: **Package**


### Package `io.opentelemetry` artifacts
- **Upstream URL:** https://github.com/open-telemetry/opentelemetry-java
- **Build system:** Gradle
- **Artifact:** `opentelemetry-api`
  - Required version: `1.47.0`
  - Action: **Package**
- **Artifact:** `opentelemetry-context`
  - Required version: `1.47.0`
  - Action: **Package**
- **Artifact:** `opentelemetry-extension-kotlin`
  - Required version: `1.47.0`
  - Action: **Package**

### Package `arrow-java` artifacts
- **Upstream URL:** https://github.com/apache/arrow-java
- **Build system:** Maven
- **Artifact:** `arrow-algorithm`
  - Required version: `18.2.0`
  - Action: **Package**
- **Artifact:** `arrow-format`
  - Required version: `18.2.0`
  - Action: **Package**
- **Artifact:** `arrow-memory-core`
  - Required version: `18.2.0`
  - Action: **Package**
- **Artifact:** `arrow-memory-netty`
  - Required version: `18.2.0`
  - Action: **Package**
- **Artifact:** `arrow-memory-netty-buffer-patch`
  - Required version: `18.2.0`
  - Action: **Package**
- **Artifact:** `arrow-vector`
  - Required version: `18.2.0`
  - Action: **Package**

### Disable `org.atteo` artifacts
- **Upstream URL:** https://github.com/atteo/evo-inflector
- **Build system:** Maven
- **Artifact:** `evo-inflector`
  - Required version: `1.3`
  - Action: **Package**

### Upload `org.codehaus.groovy` artifacts - ready in PPA
- **Upstream URL:** https://github.com/apache/groovy
- **Build system:** Gradle
- **Artifact:** `groovy`
  - Required version: `3.0.19`
  - Debian versions: 2.4.21, debian
  - Action: **Upgrade**

### Package `org.jetbrains.intellij.plugins` artifacts
- **Upstream URL:** https://github.com/JetBrains/intellij-plugin-structure
- **Build system:** Gradle
- **Artifact:** `structure-base`
  - Required version: `3.276`
  - Action: **Package**
- **Artifact:** `structure-intellij`
  - Required version: `3.276`
  - Action: **Package**

### Package `org.jetbrains.jps` artifacts
- **Upstream URL:** https://github.com/JetBrains/intellij-community
- **Build system:** Gradle
- **Artifact:** `jps-javac-extension`
  - Required version: `10`
  - Action: **Package**

### Package `org.jetbrains.teamcity` artifacts
- **Upstream URL:** https://github.com/JetBrains/teamcity-service-messages
- **Build system:** Gradle
- **Artifact:** `serviceMessages`
  - Required version: `2024.07`
  - Action: **Package**

### Disable `org.jetbrains.testDiscovery` artifacts
- **Upstream URL:** JetBrains internal test-discovery tooling
- **Build system:** Unknown
- **Artifact:** `test-discovery-plugin-base`
  - Required version: `0.1.191`
  - Action: **Disable**
- **Note:** Public source repository is not known; may need to be sourced from JetBrains internally.

