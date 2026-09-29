# Your task

Update minimal build of intellij-community

# What to exclude

Exclude jar files found in `skip-build.csv` from building.

# How to patch

Create commits in intellij-community.

# How to validate

Remove all files from `gradle-kotlin-maven-repo` and build intellij.
Check that none of the files found in `skip-build.csv` are present.

# Build intellij-community

./build.sh intellij


