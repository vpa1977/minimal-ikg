# Plan: remove the OpenTelemetry dependency from intellij-community, keep NOOP tracers

## Goal

Strip OpenTelemetry from the IntelliJ build so that:

- No OTel SDK / exporter / agent / semconv jars are needed to build or ship the IDE; at most the tiny `opentelemetry-api` + `opentelemetry-context` interface jars remain.
- All ~80 instrumentation call sites (`TelemetryManager.getTracer/getMeter`, `span()`, `rootTask`) **keep compiling untouched** and become no-ops at runtime via the existing `NoopTelemetryManager` / `IJNoopTracer` / `NoopIntelliJTracer`.
- The classic startup timeline (`StartUpMeasurer`/`ActivityImpl`) keeps working — it is **not** OTel and must survive.
- Validation: `./build.sh intellij` passes (bazel vendor → bazel build → `OpenSourceCommunityInstallersBuildTarget` → maven artifacts).

## Key audit findings (why the plan is shaped this way)

1. **`TelemetryManager` falls back to NOOP by itself** — `TelemetryManager.kt:117-142`: if `setTelemetryManager` is never called and no `META-INF/services` entry exists, `getInstance()` returns `NoopTelemetryManager`, and every `getTracer()` returns `IJNoopTracer`. Removing the impl makes all instrumentation inert **without touching call sites**.
2. **The facade is typed on OTel API**: `IJTracer extends io.opentelemetry.api.trace.Tracer`, `getMeter()` returns OTel `Meter`, `IJNoopTracer` uses `TracerProvider.noop()`. ~266 files import `io.opentelemetry.*`. ⇒ Full removal of the API jar conflicts with "leave NOOP tracers"; the plan keeps `api`+`context` jars (Phase 2) and documents the optional full-purge (Phase 4) as **not recommended**.
3. **`tracer.kt` in telemetry-impl is NOT OTel** — `span()`, `rootTask()`, `getTraceActivity()`, `TraceReporter`, `DefaultTraceReporter` are coroutine-time measurers feeding `StartUpMeasurer.addActivity()` (`tracer.kt:201-204`). They are used by ~40 files in `platform/bootstrap` (`Main.kt`), `platform-impl/bootstrap` (`ApplicationLoader.kt`, `IdeStarter.kt`, `startup.kt`, …), `platform-impl`, `lang-impl`. They must be **moved, not deleted**.
4. **Move destination confirmed**: `StartUpMeasurer.java`, `ActivityImpl.java`, `Scope.kt` all live in `platform/diagnostic/src` (module `intellij.platform.diagnostic`), which already has `kotlinx-coroutines-core` and already violates its `packagePrefix` (`Scope.kt` is in package `c.i.p.diagnostic.telemetry`). Moving `tracer.kt`+`TraceReporter.kt` there **keeping the package `com.intellij.platform.diagnostic.telemetry.impl`** means zero import edits at call sites.
5. **The impl is wired in exactly four places**: `ApplicationLoader.kt:136-137` (`setTelemetryManager(TelemetryManagerImpl(...))`), `StartUpPerformanceReporter.kt:127-128` (startup activities hook), and two `META-INF/services/...TelemetryManager` files (`platform/testFramework/core/resources`, `tools/intellij.tools.ide.metrics.benchmark/resources`).
6. **The EP `com.intellij.openTelemetryExporterProvider`** (declared in `telemetry-impl/resources/META-INF/OpenTelemetryExtensions.xml`) has registrations in `platform/vcs-log/impl/resources/intellij.platform.vcs.log.impl.xml:101` (`VcsLogTelemetryExporter`) and `platform/remoteDev-util/resources/META-INF/RemoteDevUtil.xml:10-12` (`RdctExportersProvider`, `LuxExportersProvider`, `CustomExportersListener`). Registrations must die with the EP.
7. **Active metric reporters to delete** (they'd spin forever against a NOOP meter): `JVMStatsToOTelReporter.kt` (registered `PlatformExtensions.xml:1760`) and `OtelReportingEventWatcher.java` (instantiated `EventWatcherService.java:20`).
8. **Gradle**: registrations in `plugins/gradle/plugin-resources/META-INF/plugin.xml:68` (`GradleOpenTelemetryResolverExtension`) and `:82` (`GradleTelemetryAgentProvidingExecutionHelperExtension`); daemon-side `GradleOpenTelemetry.java` in `tooling-extension-impl` (find its call sites with `grep -rn "GradleOpenTelemetry\|callWithSpan" plugins/gradle/tooling-extension-impl/src`).
9. **Maven** is the deepest packaging touch: module `intellij.maven.server.telemetry` is on the forked server classpath — `Maven3Support.java:84,110,133`, `Maven4Support.java:85,108,127`; used by `maven3-server-impl` (`Maven3XServerEmbedder`, `Maven3XProjectResolver`) and `maven40-server-impl` (`Maven40ServerEmbedderImpl`, `Maven40ProjectResolver`); packaged via `plugins/maven/plugin-content.yaml:18-20`, `CommunityRepositoryModules.kt:93`, `build/deps/.../BundledMavenDownloader.kt:172`.
10. **Product layout refs**: `PlatformModules.kt:170` (`"intellij.platform.diagnostic.telemetry.rt"`), `.idea/modules.xml:361,433-435`, `platform/platform-tests` (TEST deps + `otExporters/CsvMetricsExporterTest.java`), `platform/build-scripts/dev-server` (dep on telemetry.exporters).
11. **Grazie is a non-issue**: its languagetool library *excludes* `io.opentelemetry` (`<exclude><dependency maven-id=.../>`).
12. **The build toolchain itself uses OTel** (never shipped, but it *is* why `intellij-cache/` contains `opentelemetry-sdk-1_47_0_http`): `build/jvm-rules` worker (~30 files, `WorkRequestHandler.configureOpenTelemetry`, `libs.yaml`/`libs.lock.json`/`MODULE.bazel` otlp-exporter entries) and `platform/build-scripts` + `build/tasks/.../TraceManager.kt` (~60 files using `Span`/`Attributes` for build-step tracing). Purging these is Phase 3 (optional).
13. **semconv has zero product-code imports** (only `build/jvm-rules/src/worker-framework/WorkRequestHandler.kt`); `extension-kotlin` (`asContextElement`) is used by `telemetry/helpers/trace.kt:55` and `build-scripts/impl/DistributionJARsBuilder.kt` — vendor a ~20-line `ThreadContextElement` replacement.
14. Kotlin repo's own OTel usage (`kotlin/analysis/analysis-api-platform-interface/.../KotlinGlobalOpenTelemetryProvider.kt`) is **out of scope** — not in `build.sh`'s Kotlin publish list.

## Stopping point

| Phase | Result | Recommendation |
|---|---|---|
| 1 | Runtime fully NOOP; `telemetry-impl`, `telemetry.exporters`, `telemetry/rt`, `maven-server-telemetry` deleted | Required |
| 2 | Libraries slimmed to `opentelemetry-api`+`opentelemetry-context` (2 jars); semconv/extension-kotlin/exporter-otlp-common gone | Required — **stop here** |
| 3 | OTel purged from `build/jvm-rules` + `build-scripts` ⇒ `intellij-cache/` vendor has zero opentelemetry | Optional (build-infra purity) |

## Ground rules (mirrored from build-refactor.md)

- One commit per change; coordinator runs **all** git commits and **all** builds; subagents edit files only.
- Stage explicit paths only; the tree carries pre-existing modifications — never sweep them up.
- After every Kotlin edit remove now-unused imports/vals (unused imports fail compilation only with warnings-as-errors, but stale imports to deleted packages fail outright).
- Order matters within a commit stack: **move first, remove registrations before deleting declarations, delete modules last, slim libraries final**.
- Call sites of `TelemetryManager.*`, `span()`, `rootTask()`, `IJTracer`, `TracerLevel`, `Scope` must remain byte-identical — that is the "leave NOOP tracers" contract. Verify with `git diff` per commit: those files appear only where an unused import had to be dropped.

## Workflow

### Phase 0 — baseline

Run `./build.sh intellij` on the untouched tag; keep the console log. Record: `unzip -l out/idea-ce/.../lib/opentelemetry.jar`, `ls intellij-cache | grep -i opentelemetry`, and the produced `intellij-repo` artifact list. This is the comparison baseline.

### Phase 1 — functional removal (runtime NOOP)

**Commit 1 — move the coroutine tracer machinery to `intellij.platform.diagnostic`.**
Move (keep packages!):
- `platform/diagnostic/telemetry-impl/src/tracer.kt` → `platform/diagnostic/src/` (package `c.i.p.diagnostic.telemetry.impl`)
- `.../src/TraceReporter.kt` → same
- `.../src/helpers/ReentrantLockUsageMonitor.java`, `ReentrantReadWriteLockUsageMonitor.java` → `platform/diagnostic/src/` (package `c.i.p.diagnostic.telemetry.impl.helpers`)
In every iml/BUILD that depended on `intellij.platform.diagnostic.telemetry.impl` *only* for these helpers (`platform/bootstrap`, `platform-impl/bootstrap`, `platform-impl`, `lang-impl`, …): swap module dep `telemetry.impl` → `intellij.platform.diagnostic`. Grep to find them: `grep -rln "intellij.platform.diagnostic.telemetry.impl" --include=*.iml` and `grep -rln "telemetry-impl" --include=BUILD.bazel`.
Validate: `bazel build //build:i_build_target_deploy.jar` compiles (JPS not yet involved) — or defer to central loop.

**Commit 2 — cut the impl wiring.**
- `ApplicationLoader.kt`: delete `setTelemetryManager(TelemetryManagerImpl(...))` + the two telemetry-impl imports (keep `...impl.span`).
- `StartUpPerformanceReporter.kt`: delete the `(TelemetryManager.getInstance() as? TelemetryManagerImpl)?.addStartupActivities(...)` block + imports `TelemetryManager(TelemetryManagerImpl)` if unused; drop `telemetry.impl` orderEntry from its iml.
- Delete `platform/testFramework/core/resources/META-INF/services/com.intellij.platform.diagnostic.telemetry.TelemetryManager` and the same file under `tools/intellij.tools.ide.metrics.benchmark/resources`.

**Commit 3 — remove EP + provider implementations.**
Delete `VcsLogTelemetryExporter.kt` + its `<openTelemetryExporterProvider>` line in `intellij.platform.vcs.log.impl.xml`; delete `platform/remoteDev-util/src/com/intellij/remoteDev/tracing/` (`RdctExportersProvider`, `LuxExportersProvider`, `CustomExportersListener`, `TelemetryDataUtil`) + the three registrations in `RemoteDevUtil.xml`; drop `telemetry.impl`/`telemetry.exporters` deps from `intellij.remoteDev.util.iml` + `remoteDev-util/BUILD.bazel`. (Grep remoteDev-util for remaining `io.opentelemetry` imports; if none remain, drop the libs from its iml in Phase 2.)

**Commit 4 — remove Gradle OTel.**
Delete `GradleTelemetryAgentProvidingExecutionHelperExtension.kt` + plugin.xml line 82; `GradleOpenTelemetryResolverExtension.java` + line 68; `tooling-extension-impl/.../telemetry/GradleOpenTelemetry.java` + all call sites inside tooling-extension-impl (unwrap `telemetry.callWithSpan(name){...}` → direct call); remove `intellij.platform.diagnostic.telemetry.rt`/`.impl` module deps from `intellij.gradle.iml`, `intellij.gradle.toolingExtension.impl.iml`, `plugins/gradle/BUILD.bazel`, `tooling-extension-impl/BUILD.bazel`. Keep `ExternalSystemTelemetryUtil.java` (facade-only, NOOPs).

**Commit 5 — remove Maven OTel.**
Delete `plugins/maven/maven-server-telemetry/` (whole dir); strip classpath lines in `Maven3Support.java`/`Maven4Support.java` (+unused import); unwrap `MavenServerOpenTelemetry` in the four embedder/resolver files (call sites are `callWithSpan(name, () -> ...)` → `...`); remove `plugin-content.yaml` entries, `CommunityRepositoryModules.kt:93`, `BundledMavenDownloader.kt:172` (delete the now-unused `mavenTelemetryDependencies` val — check its other uses first); remove deps from `plugins/maven/BUILD.bazel`, `maven3-server-impl/`, `maven40-server-impl/` (iml+BUILD), `intellij.maven.iml`; remove `.idea/modules.xml:361`. Keep `plugins/maven/.../telemetry/telemetry.kt` (facade tracer → NOOP).

**Commit 6 — remove active metric reporters.**
Delete `JVMStatsToOTelReporter.kt` + `PlatformExtensions.xml:1760`; delete `OtelReportingEventWatcher.java` + its instantiation in `EventWatcherService.java:20` (leave the other watchers); fix `EventWatcher.java`'s `@see` javadoc reference.

**Commit 7 — delete the three telemetry modules.**
`git rm -r platform/diagnostic/telemetry-impl platform/diagnostic/telemetry.exporters platform/diagnostic/telemetry/rt`; remove `.idea/modules.xml:433-435`; `PlatformModules.kt:170`; TEST orderEntries + `platform/platform-tests/BUILD.bazel` refs; `otExporters/CsvMetricsExporterTest.java`; `dev-server` iml+BUILD refs; `intellij.idea.community.main.iml` if present (grep). Also `tools/*metrics*` — decide: exclude from `.idea/modules.xml` (recommended; they need the deleted JSON importer/SDK mixins) like `trim_android` does.

**Central verification** (coordinator): `./build.sh intellij`. Expect and fix per "Fallout patterns".

### Phase 2 — library slimming

**Commit 8 — slim the telemetry API module.**
In `platform/diagnostic/telemetry`: delete `AsyncSpanExporter.kt`, `AggregatedMetricExporter.kt`, `FilteredMetricsExporter.kt`, `MetricsExporterEntry.kt`, `MetricsExtensions.kt`, `MetricsImporterUtils.kt`, `OpenTelemetryUtils.kt`, `OtlpConfiguration.kt` (grep each for surviving consumers first — all died in Phase 1 except possibly ijent/`Measurer.kt`, which only needs `TelemetryManager`). Vendor `asContextElement` replacement into `helpers/trace.kt` (replace the `io.opentelemetry.extension.kotlin` import; the implementation is a `ThreadContextElement<Scope>` whose update/restore wrap `Context.makeCurrent()`/`close()`). Update `api-dump.txt`, `exposed-third-party-api.txt`. Remove `opentelemetry-semconv`/`opentelemetry-extension-kotlin` orderEntries from `intellij.platform.diagnostic.telemetry.iml`.

**Commit 9 — delete three library definitions.**
Delete `.idea/libraries/opentelemetry_semconv.xml`, `opentelemetry_extension_kotlin.xml`, `opentelemetry_exporter_otlp_common.xml`; remove every `<orderEntry ... name="opentelemetry-semconv"/"opentelemetry-extension-kotlin"/"opentelemetry-exporter-otlp-common"/>` (~15 iml files) and the matching `@lib//:` deps in BUILD.bazel files; remove their targets from `lib/BUILD.bazel` + `lib/MODULE.bazel`.

**Commit 10 — slim `opentelemetry` to api+context.**
`.idea/libraries/opentelemetry.xml`: drop `sdk`, `sdk-common`, `sdk-trace`, `sdk-metrics`, `sdk-logs` artifacts (keep `opentelemetry-api`, `opentelemetry-context` 1.47.0, classes+sources). Same in `lib/BUILD.bazel` (the `jvm_import`/`kt_jvm_import` target) + `lib/MODULE.bazel` http entries. The ~50 iml files with `name="opentelemetry"` stay untouched.

**Central verification**: `./build.sh intellij` (full, incl. `bazel vendor` so the vendored `@lib//` repos regenerate), then artifact checks (below).

### Phase 3 — optional: purge the build toolchain

**Commit 11** — `build/jvm-rules`: neuter `WorkRequestHandler.configureOpenTelemetry` (return a NOOP tracer), strip `Span`/`Tracer`/`Attributes` from jps-builder/kotlin-builder/worker-framework (mechanical, batched subagent), remove otlp entries from `libs.yaml`, `libs.lock.json`, `MODULE.bazel`, `BUILD.bazel`, `src/misc/BUILD.bazel`, `src/jps-builder/BUILD.bazel`, delete `jaeger-config.yaml`.
**Commit 12** — `platform/build-scripts` + `build/tasks`: delete `TraceManager.kt` SDK setup (return no-op `spanBuilder`), strip `Span`/`AttributeKey`/`StatusCode` usage (~60 files, batched), remove `@lib//:opentelemetry*` from build-scripts BUILD.bazel files. Validate: `bazel vendor` output contains **zero** `opentelemetry` dirs; `ls intellij-cache | grep -ci opentelemetry` → 0.

### Phase 4 — optional, not recommended

Vendor minimal no-op interfaces (`Tracer`, `SpanBuilder`, `Span`, `Meter`, gauges/observers, `Attributes`, `Context`) under `com.intellij.platform.diagnostic.telemetry.noop`, re-type `IJTracer`, rewrite `io.opentelemetry.*` imports in ~266 files (10–15 batched subagents by directory family). Rejected: massive churn, zero runtime benefit over Phase 2 (api+context jars are interface-only and already no-op without an SDK).

## Fallout patterns (central verification loop)

- **JPS model load failure** "cannot find module …telemetry.impl/exporters/rt" → stale orderEntry in an iml or `modules.xml` entry missed. Grep the exact string, remove, rebuild.
- **Plugin XML validation** "cannot find extension point openTelemetryExporterProvider" → a registration survived Commit 3 (check vcs-log/remoteDev xml).
- **`checkProductLayout` / `findRequiredModule`** → missed `PlatformModules.kt`, `plugin-content.yaml`, or `CommunityRepositoryModules.kt` entry; also `build/IdeaCommunityProperties.kt`-style lists.
- **Kotlin compile errors** `unresolved reference: span/rootTask` → consuming module lost its dep in Commit 1; add dep on `intellij.platform.diagnostic` (iml + BUILD.bazel).
- **`unresolved reference: io.opentelemetry.extension.kotlin`** → missed `asContextElement` user (only `trace.kt` in product; `DistributionJARsBuilder.kt` if Phase 3 skipped build-scripts — leave build-scripts' extension-kotlin dep alone in Phase 2, it's `@lib//`-served there. Careful: build-scripts iml `intellij.platform.buildScripts.iml` lists `opentelemetry-extension-kotlin` — that entry serves the build module; remove only in Phase 3.)
- **class-report drift**: `build/tasks/resources/{linux,windows,mac}/class-report.txt` list `io/opentelemetry/**:lib/opentelemetry.jar` and `c/i/p/diagnostic/telemetry/impl/**:lib/app-client.jar`. If the build validates these (check `build/tasks/src` for the consumer before Commit 7), regenerate/trim them in the same commit as module deletion.
- **Runtime `ServiceConfigurationError`** at IDE start → a `META-INF/services` file survived Commit 2.
- **api-dump / exposed-third-party-api check failures** → hand-trim those txt files in Commit 8.
- Bazel auto-generated sections (`### auto-generated … start/end`) — hand-edits are expected in this fork (same as `fix_intellij_lib_build_file`); never run the upstream iml→bazel regenerator afterwards or the edits are lost.

## Final validation

1. `./build.sh intellij` → BUILD SUCCESSFUL, maven artifacts in `intellij-repo/`.
2. `unzip -l <dist>/lib/opentelemetry.jar` → only `io/opentelemetry/api/**` and `io/opentelemetry/context/**` (Phase 2), or jar absent (Phase 3+4).
3. `ls intellij-cache | grep -i opentelemetry` → only `opentelemetry-api`/`opentelemetry-context` after Phase 2; empty after Phase 3.
4. `grep -rl "io.opentelemetry.sdk\|io.opentelemetry.exporter\|io.opentelemetry.semconv" platform plugins java --include=*.kt --include=*.java` → empty (excluding `tools/`, `fleet/`, `build/jvm-rules`, `platform/build-scripts` until Phase 3).
5. `git diff <tag> --stat -- platform/lang-impl platform/vcs-impl platform/core-impl` → instrumentation call sites untouched except deleted reporters and dropped unused imports (NOOP contract).
6. `./build.sh kotlin gradle` — downstream steps still resolve `com.jetbrains.intellij.*` artifacts (their poms no longer reference `io.opentelemetry:*`; note `intellij-repo/.../core-impl-*.pom` currently lists `opentelemetry.semconv` — after the trim it must be gone; this is a hard check since Kotlin/Gradle dependency resolution breaks on missing artifacts otherwise).

## Operational notes

- Batch subagent edits by family: (a) bootstrap+platform-impl, (b) vcs-log+vcs, (c) gradle, (d) maven, (e) remoteDev+ijent, (f) tests+tools+modules.xml+BUILD.bazel sweep. Each gets: file list, exact deletions, the "don't touch call sites" rule, no git/bazel.
- `git mv` the Commit-1 files to preserve history.
- Keep `TelemetryManager.kt`, `IJTracer.kt`, `PlatformScopes.kt`, `IntelliJTracer`, `Scope.kt`, measurers, `TraceUtil.java`, `SharedMetrics.java` byte-identical throughout — they are the NOOP surface.
- `lib/opentelemetry.jar` shrinking is automatic (the build merges module libraries by name); no layout edit needed for the jar itself.