# Build refactor: trim a Gradle monorepo to only what an entry build script uses

Instructions for refactoring a large Gradle monorepo ("the project") so its build
scripts only include the tasks and dependencies used by a given entry-point build
script (`build.sh`), with one commit per change.

## Goal

Rewrite the project's build scripts so that:

- Only the tasks and dependencies used by `build.sh` are included.
- All javadoc tasks are dropped from the new build.
- Each change lands as a single commit in the project repository.
- Validation: the relevant `build.sh` step passes.

## Inputs

- `build.sh` — the entry script; extract the exact Gradle invocation from it
  (task list, `-P`/`-D` properties, init scripts, `GRADLE_USER_HOME`, `JAVA_HOME`).
- The project repository checkout (a large multi-project Gradle build).

## Ground rules

- One commit per change: one commit per modified subproject build script, plus
  separate commits for `settings` and root build script changes. Stage explicit
  paths only; never sweep up pre-existing unrelated working-tree modifications.
- Never commit generated/unrelated files; keep the tree's pre-existing dirty
  state untouched.
- Parallel subagents must never run `git` or `gradle` in the same checkout —
  the coordinator does all commits and all Gradle verification runs centrally.
- `org.gradle.kotlin.dsl.allWarningsAsErrors=true`: after every edit, unused
  imports/vals in `.kts` files fail the build. Remove them.

## Workflow

### 1. Compute the used-task closure

Check that `build.sh` exist. Abort if it does not.

Run the exact `build.sh` Gradle invocation with `--dry-run` and parse the output
for `:project:task SKIPPED` lines. This yields:

- the set of projects whose tasks are used (the "closure"),
- the per-project list of used tasks (source of truth for the rewrites).

Projects needed only at configuration time (bootstrap shims, generators whose
outputs are checked in) do NOT appear in the closure — handle them in step 5.

### 2. Trim `settings.gradle(.kts)` (commit 1)

- Include only closure projects; drop dead conditional include blocks and
  projectDir remappings for removed projects.
- Keep pluginManagement, included convention builds, dependencyResolutionManagement.
- Beware warnings-as-errors: remove now-unused vals (e.g. a `buildProperties`
  val only used by dropped conditionals).

### 3. Trim the root build script (commit 2)

- Drop aggregate/lifecycle task registrations (dist, test lifecycle, packaging,
  IDE artifact publishing) — especially anything calling `project(":removed")`
  at configuration time.
- Keep: global resolution strategies, shared `extra` properties consumed by
  subprojects/conventions, `allprojects`/`subprojects` configuration,
  repositories, and hooks that affect used tasks' outputs (e.g. jar compression).

### 4. Rewrite subproject build scripts with batched subagents

Batch similar subprojects (by directory/family) into ~10–15 batches; spawn one
subagent per batch in parallel. Each subagent gets: its project list with
directories, build-file names, used-task lists, the full closure list, and the
rules below. Subagents edit files only — no git, no gradle runs.

Per-build-script rules:

1. KEEP everything needed to realize the project's used tasks with identical
   behavior: plugins (unless test/verification-only), main source-set wiring,
   api/implementation/compileOnly/runtimeOnly deps of main compilations, used
   task configuration, and the maven publication of the main artifacts
   (jar + sources + pom). If `testFixtures*` tasks are in the used list, keep
   that wiring too — it is a published variant.
2. DROP all javadoc even if listed as used: `javadocJar(...)`,
   `withJavadocJar()`, `standardPublicJars()` (replace with
   `runtimeJar(); sourcesJar()`), dokka config, `emptyJavadocJar`. Publications
   lose the `-javadoc.jar` artifact — that is the goal.
3. DROP test infrastructure: test source sets, test* dependencies, `testsJar()`,
   `tasks.test`/`withType<Test>` config, `projectTests(...)`, custom test
   tasks/source sets, test-only plugins.
4. DROP IDE-publishing helpers (`publishJarsForIde(...)`,
   `idePluginDependency { ... }`) — they evaluate project lists at configuration
   time.
5. DROP every `project(":...")` reference to a project outside the closure
   (such references throw at configuration time).
6. DROP self-registered tasks not in the used list unless a used task depends
   on them.
7. Do NOT change versions, artifactIds, publication names, compiler arguments
   of used compile tasks, or resource processing.
8. Already-minimal files: leave unchanged.
9. When unsure whether something feeds a used task: KEEP it and report the doubt.

### 5. Central verification loop

After all batches land, re-run the `--dry-run` and fix failures iteratively.
Common fallout patterns:

- Convention plugins requiring root lifecycle tasks removed in step 3
  (e.g. a publishing convention wiring into a root `mvnInstall`) — restore a
  minimal lifecycle task.
- Configuration-time references to projects outside the closure (bootstrap
  shim projects used for dependency substitution) — re-include those shims.
- Generator-project wiring (`generatedConfigurationKeys`, `generated-sources`
  plugin) whose generator is outside the closure — replace with the checked-in
  generated sources (`java.srcDir("gen")`).
- Plugins that unconditionally add javadoc (e.g. `com.gradle.plugin-publish`)
  — suppress the javadoc variant in an `afterEvaluate` block:
  `(components["java"] as AdhocComponentWithVariants)
      .withVariantsFromConfiguration(configurations["javadocElements"]) { skip() }`
- Main-compilation dependencies (e.g. an explicit `compileOnly` stdlib)
  mistakenly removed together with unused wiring — restore them.

Verify at the end: all entry targets present in the graph, zero
`javadoc`/`javadocJar` tasks in the graph.

### 6. Commit per subproject

Map every changed build file to its owning subproject and create one commit per
subproject with a message like:

```
Trim <name> build script to the tasks used by build.sh

Drop javadoc wiring, test infrastructure, references to projects outside
the trimmed closure (as applicable).

Keep only the wiring needed by the publishToMavenLocal task graph used
by build.sh.
```

### 7. Final validation

Run the full `build.sh` step (not a dry-run). Confirm BUILD SUCCESSFUL and that
no `-javadoc.jar` artifacts are produced (e.g. `find <local-repo> -name
"*-javadoc.jar" -newermt <build-start>` returns nothing).

## Operational notes

- Background subagents may complete with an empty result and no edits; resume
  them with a direct "now do the work" prompt (same task_id) — the second pass
  performs the edits.
- Keep subagents out of Gradle/git: parallel Gradle runs in one checkout fight
  over the configuration cache and project-local state; parallel commits race
  on the git index.
- Spot-check subagent diffs against the used-task lists (e.g. dropped
  `java-test-fixtures` must not have `testFixtures*` tasks in the used list).
