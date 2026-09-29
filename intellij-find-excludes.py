#!/usr/bin/env python3
"""Find Maven artifacts in gradle-kotlin-maven-repo that are not already present in gradle-kotlin.

For every jar under gradle-kotlin-maven-repo we derive its Maven coordinates from the
standard Maven repository layout. Any jar whose basename also appears somewhere under
gradle-kotlin is considered already available and is excluded. The remaining jars are
written to skip-build.csv.
"""

from __future__ import annotations

import csv
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
REPO_DIR = ROOT / "gradle-kotlin-maven-repo"
GRADLE_KOTLIN_DIR = ROOT / "gradle-kotlin"
OUTPUT_CSV = ROOT / "skip-build.csv"


def parse_maven_coordinates(jar_path: Path, repo_root: Path) -> tuple[str, str, str, str]:
    """Parse Maven coordinates from a jar path in a Maven repository layout.

    Returns (group_id, artifact_id, version, classifier) where classifier may be empty.
    """
    relative = jar_path.relative_to(repo_root)
    parts = relative.parts
    if len(parts) < 3:
        raise ValueError(f"Path does not look like a Maven artifact: {jar_path}")

    # Layout: <groupId segments>/<artifactId>/<version>/<filename>.jar
    version = parts[-2]
    artifact_id = parts[-3]
    group_id = ".".join(parts[:-3])

    stem = jar_path.stem  # filename without .jar
    prefix = f"{artifact_id}-{version}"
    if stem == prefix:
        classifier = ""
    elif stem.startswith(prefix + "-"):
        classifier = stem[len(prefix) + 1 :]
    else:
        classifier = ""

    return group_id, artifact_id, version, classifier


def format_coordinates(group_id: str, artifact_id: str, version: str, classifier: str) -> str:
    coord = f"{group_id}:{artifact_id}:{version}"
    if classifier:
        coord = f"{coord}:{classifier}"
    return coord


def collect_jars(directory: Path) -> list[Path]:
    if not directory.exists():
        print(f"ERROR: directory does not exist: {directory}", file=sys.stderr)
        sys.exit(1)
    return sorted(directory.rglob("*.jar"))


def main() -> int:
    maven_jars = collect_jars(REPO_DIR)
    gradle_kotlin_jars = collect_jars(GRADLE_KOTLIN_DIR)
    gradle_kotlin_basenames = {jar.name for jar in gradle_kotlin_jars}

    rows: list[tuple[str, str]] = []
    for jar in maven_jars:
        if jar.name in gradle_kotlin_basenames:
            continue
        group_id, artifact_id, version, classifier = parse_maven_coordinates(jar, REPO_DIR)
        coord = format_coordinates(group_id, artifact_id, version, classifier)
        rows.append((str(jar.relative_to(ROOT)), coord))

    with OUTPUT_CSV.open("w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["jar", "maven_coordinates"])
        writer.writerows(rows)

    print(f"Wrote {len(rows)} jars to {OUTPUT_CSV}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
