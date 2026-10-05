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

### 1. Investigate usages

Find all usages of the plugin, types, and the project (where the project is included).

### 2. Remove all usages

Batch the usages to subagents and perform the code removal.
Once subagents finish, validate the build and collect the build errors.

### 3. Work on errors

Batch the errors and offload fixes to subagents.
Remove the code that does not compile.


## 4. Commit

Create commit. Add full investigation summary and what was done in the commit message