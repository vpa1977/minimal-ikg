# You task

Write the shell script to build intellij -> kotlin -> gradle
by calling minimal build commands described in Plan.md.

Use intellij-cache bazel vendor directory for intellij build
Use gradle-kotlin gradle user home for kotlin and gradle builds
Use gradle-kotlin-maven-repo for kotlin and gradle build maven repositories

DO NOT USE installers.cmd command directly for intellij, USE bazel command.

Write build.sh shell script.
Write init scripts to use local repositories.

Validate the clean build -> intellij and kotlin dependencies MUST come from gradle-kotlin-maven-repo.



