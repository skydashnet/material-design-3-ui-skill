#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
SKILL = ROOT / "SKILL.md"
MANIFEST = ROOT / "skill-files.txt"

errors: list[str] = []

def require(condition: bool, message: str) -> None:
    if not condition:
        errors.append(message)

require(SKILL.is_file(), "SKILL.md is missing")
require(MANIFEST.is_file(), "skill-files.txt is missing")

text = SKILL.read_text(encoding="utf-8") if SKILL.exists() else ""

require(text.startswith("---\n"), "SKILL.md must start with YAML frontmatter")
frontmatter_match = re.match(r"^---\n(.*?)\n---\n", text, re.S)
require(frontmatter_match is not None, "SKILL.md frontmatter is malformed")

frontmatter = frontmatter_match.group(1) if frontmatter_match else ""
require(re.search(r"(?m)^name:\s*material-design-3-ui\s*$", frontmatter) is not None,
        "SKILL.md name must be material-design-3-ui")
require(re.search(r"(?m)^\s*version:\s*1\.1\.0\s*$", frontmatter) is not None,
        "SKILL.md version must be 1.1.0")
require(re.search(r"(?m)^description:\s*\S", frontmatter) is not None,
        "SKILL.md description is required")

# Progressive-disclosure references linked from SKILL.md.
linked_refs = sorted(set(re.findall(r"`(references/[^`]+\.md)`", text)))
require(len(linked_refs) >= 10, "SKILL.md should route to progressive-disclosure references")

for rel in linked_refs:
    require((ROOT / rel).is_file(), f"Referenced file is missing: {rel}")

manifest = []
if MANIFEST.exists():
    manifest = [
        line.strip()
        for line in MANIFEST.read_text(encoding="utf-8").splitlines()
        if line.strip() and not line.lstrip().startswith("#")
    ]

require("SKILL.md" in manifest, "skill-files.txt must include SKILL.md")
for rel in linked_refs:
    require(rel in manifest, f"skill-files.txt does not include linked reference: {rel}")

for rel in manifest:
    require((ROOT / rel).is_file(), f"Manifest entry is missing: {rel}")

require(len(manifest) == len(set(manifest)), "skill-files.txt contains duplicate entries")

# Guardrails that are central to this skill's positioning.
guardrails = [
    "Choose components by purpose and behavior",
    "Do not use color alone",
    "Do not wrap every section or list row in a card",
    "Do not use chips as generic buttons or primary navigation",
    "Accessibility is a release requirement",
    "Self-audit",
]
for phrase in guardrails:
    require(phrase.lower() in text.lower(), f"Core guardrail missing from SKILL.md: {phrase}")

# Repository and distribution files.
required_repo_files = [
    "README.md",
    "CONTRIBUTING.md",
    "CHANGELOG.md",
    "LICENSE",
    "install.sh",
    "install.ps1",
    "uninstall.sh",
    "uninstall.ps1",
]
for rel in required_repo_files:
    require((ROOT / rel).is_file(), f"Repository file is missing: {rel}")

# Ensure every supported host still appears in both installers.
agents = ["claude", "codex", "antigravity", "kiro", "opencode", "hermes", "openclaw"]
for installer in ["install.sh", "install.ps1"]:
    p = ROOT / installer
    installer_text = p.read_text(encoding="utf-8") if p.exists() else ""
    for agent in agents:
        require(agent in installer_text.lower(), f"{installer} is missing supported agent: {agent}")

case_files = sorted((ROOT / "tests" / "cases").glob("*.md"))
require(len(case_files) >= 6, "Expected at least 6 behavioral evaluation cases")

if errors:
    print("Validation failed:")
    for error in errors:
        print(f" - {error}")
    sys.exit(1)

print("Material Design 3 UI Skill validation passed.")
print(f" - SKILL.md: {len(text.splitlines())} lines")
print(f" - References: {len(linked_refs)}")
print(f" - Package files: {len(manifest)}")
print(f" - Behavioral cases: {len(case_files)}")
