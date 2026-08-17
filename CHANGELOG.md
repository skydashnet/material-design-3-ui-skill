# Changelog

All notable changes to this project are documented here.

The project follows semantic versioning for changes to the skill’s operational behavior.

## \[1.1.0\] - 2026-08-17

### Added

- Progressive-disclosure `references/` architecture.
- Dedicated references for color, typography, shape/elevation, spacing/layout, component selection, navigation, forms/input, feedback/overlays, adaptive design, accessibility, motion, M3 Expressive, and anti-patterns.
- Explicit reference-routing table in `SKILL.md`.
- Eight-category UI self-audit with approval guardrails.
- `skill-files.txt` package manifest for cross-agent installation.
- Behavioral evaluation cases under `tests/cases/`.
- Static repository/skill validator.
- GitHub Actions validation workflow.

### Changed

- Refactored `SKILL.md` from a monolithic reference into a smaller operational decision engine.
- Version-sensitive implementation guidance now avoids hardcoding library versions unless verified.
- Cross-agent installers now distribute the complete skill package, including referenced files, rather than only `SKILL.md`.
- README installation and architecture documentation updated for the v1.1 package.

### Compatibility

Supported global installation targets: - Claude Code - OpenAI Codex - Google Antigravity - Kiro - OpenCode - Hermes Agent - OpenClaw

## \[1.0.0\] - 2026-08-17

### Added

- Initial Material Design 3 UI/UX `SKILL.md`.
- Material You and Material 3 Expressive guidance.
- Component, adaptive, accessibility, motion, and anti-pattern rules.
- Cross-platform Bash and PowerShell installers/uninstallers.
- README, MIT License, contributing guide, issue templates, and pull-request template.
