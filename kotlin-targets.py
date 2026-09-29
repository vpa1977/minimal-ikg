#!/usr/bin/env python3
"""Iterate ./build.sh until the Gradle build resolves all Kotlin dependencies.

Workflow:
1. Run ``./build.sh gradle``.
2. Parse the output for ``Could not find org.jetbrains.kotlin:<artifact>:2.4.10.``.
3. For each missing artifact id, find the project path declared via ``include(...)`` in
   ``kotlin/settings.gradle.kts`` whose last segment matches the artifact id.
4. Append ``<project-path>:publishToMavenLocal`` to the Kotlin gradlew invocation in
   ``build.sh`` (after the ``local-repos-kotlin.init.gradle.kts`` init-script line).
5. Run ``./build.sh kotlin`` to publish the newly discovered targets.
6. Repeat from step 1 until no Kotlin artifacts are reported missing.
"""

from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
BUILD_SH = ROOT / "build.sh"
KOTLIN_SETTINGS = ROOT / "kotlin" / "settings.gradle.kts"
KOTLIN_VERSION = "2.4.10"

# > Could not find org.jetbrains.kotlin:kotlin-tooling-core:2.4.10.
MISSING_ARTIFACT_RE = re.compile(
    r"Could not find org\.jetbrains\.kotlin:([^:\s]+):" + re.escape(KOTLIN_VERSION) + r"\."
)

INIT_SCRIPT_MARKER = '-I "$INIT_SCRIPTS_DIR/local-repos-kotlin.init.gradle.kts" \\\n'


def load_project_paths() -> dict[str, str]:
    """Map artifact id -> full Gradle project path using ``include(...)`` blocks."""
    text = KOTLIN_SETTINGS.read_text(encoding="utf-8")

    paths: dict[str, str] = {}
    # Capture every include(...) block, including multi-line ones.
    for block in re.findall(r"include\s*\((.*?)\)", text, re.DOTALL):
        # Extract every quoted string inside the block.
        for match in re.findall(r'"([^"]+)"', block):
            path = match.strip()
            if not path.startswith(":"):
                continue
            artifact_id = path.rsplit(":", 1)[-1]
            # Keep the first (or only) mapping; include() names are unique.
            paths.setdefault(artifact_id, path)
    return paths


def find_missing_artifacts(output: str) -> list[str]:
    """Return unique missing artifact ids in the order they first appear."""
    seen: set[str] = set()
    result: list[str] = []
    for artifact_id in MISSING_ARTIFACT_RE.findall(output):
        if artifact_id not in seen:
            seen.add(artifact_id)
            result.append(artifact_id)
    return result


def add_publish_targets(targets: list[str]) -> bool:
    """Append new ``:publishToMavenLocal`` targets to ``build.sh`` if not present."""
    content = BUILD_SH.read_text(encoding="utf-8")

    if INIT_SCRIPT_MARKER not in content:
        print(f"ERROR: could not find init-script marker in {BUILD_SH}", file=sys.stderr)
        sys.exit(1)

    new_targets = [t for t in targets if f"{t}:publishToMavenLocal" not in content]
    if not new_targets:
        return False

    lines = [f"            {t}:publishToMavenLocal \\\n" for t in new_targets]
    content = content.replace(
        INIT_SCRIPT_MARKER,
        INIT_SCRIPT_MARKER + "".join(lines),
        1,
    )
    BUILD_SH.write_text(content, encoding="utf-8")
    return True


def run_build(step: str) -> subprocess.CompletedProcess[str]:
    print(f"\n=== running ./build.sh {step} ===")
    return subprocess.run(
        ["./build.sh", step],
        cwd=ROOT,
        capture_output=True,
        text=True,
    )


def main() -> int:
    project_paths = load_project_paths()

    iteration = 0
    while True:
        iteration += 1
        print(f"\n=== iteration {iteration} ===")

        gradle_result = run_build("gradle")
        output = gradle_result.stdout + gradle_result.stderr
        missing = find_missing_artifacts(output)

        if not missing:
            if gradle_result.returncode != 0:
                print(
                    "ERROR: Gradle build failed but no missing Kotlin artifacts were detected.",
                    file=sys.stderr,
                )
                print(output[-4000:], file=sys.stderr)
                return 1
            print("Gradle build succeeded with no missing Kotlin artifacts.")
            return 0

        print(f"Missing Kotlin artifacts: {missing}")

        targets: list[str] = []
        unknown: list[str] = []
        for artifact_id in missing:
            path = project_paths.get(artifact_id)
            if path is None:
                unknown.append(artifact_id)
                # Fallback: assume top-level project with the same name.
                path = f":{artifact_id}"
            targets.append(path)

        if unknown:
            print(
                f"WARNING: could not find project path for {unknown}; "
                f"using top-level fallback.",
                file=sys.stderr,
            )

        # Remove duplicates while preserving order.
        seen: set[str] = set()
        unique_targets = [t for t in targets if not (t in seen or seen.add(t))]

        print(f"Adding publish targets: {unique_targets}")
        added = add_publish_targets(unique_targets)
        if not added:
            print(
                "ERROR: all missing targets are already present in build.sh; "
                "stopping to avoid an infinite loop.",
                file=sys.stderr,
            )
            print(output[-4000:], file=sys.stderr)
            return 1

        kotlin_result = run_build("kotlin")
        if kotlin_result.returncode != 0:
            print(
                f"ERROR: ./build.sh kotlin failed (exit {kotlin_result.returncode}).",
                file=sys.stderr,
            )
            print((kotlin_result.stdout + kotlin_result.stderr)[-4000:], file=sys.stderr)
            return 1


if __name__ == "__main__":
    sys.exit(main())
