<div align="center">

# Material Design 3 UI/UX Skill

### Design the system. Not just the screenshot.

A reusable **Agent Skill** that helps AI design and coding agents create, review, and implement interfaces using **Material Design 3**, **Material You**, and optional **Material 3 Expressive** principles.

[![Material Design 3](https://img.shields.io/badge/Material_Design-3-6750A4?style=flat-square&logo=materialdesign&logoColor=white)](https://m3.material.io/) [![Skill Version](https://img.shields.io/badge/skill-v1.1.0-1f6feb?style=flat-square)](CHANGELOG.md) [![Supported Agents](https://img.shields.io/badge/agents-7-0f9d58?style=flat-square)](#supported-agents) [![GitHub stars](https://img.shields.io/github/stars/skydashnet/material-design-3-ui-skill?style=flat-square&logo=github&label=stars)](https://github.com/skydashnet/material-design-3-ui-skill/stargazers) [![GitHub forks](https://img.shields.io/github/forks/skydashnet/material-design-3-ui-skill?style=flat-square&logo=github&label=forks)](https://github.com/skydashnet/material-design-3-ui-skill/forks) [![License](https://img.shields.io/github/license/skydashnet/material-design-3-ui-skill?style=flat-square&label=license)](LICENSE)

**Claude Code · OpenAI Codex · Google Antigravity · Kiro · OpenCode · Hermes Agent · OpenClaw**

</div>

------------------------------------------------------------------------

## Quick install

**macOS / Linux**

``` bash
curl -fsSL https://raw.githubusercontent.com/skydashnet/material-design-3-ui-skill/main/install.sh | bash
```

**Windows PowerShell**

``` powershell
irm https://raw.githubusercontent.com/skydashnet/material-design-3-ui-skill/main/install.ps1 | iex
```

> The installer distributes the same portable skill package to the supported global agent locations. It does **not** install, authenticate, configure, or launch any AI agent.

------------------------------------------------------------------------

## What this skill changes

| Without a design skill             | With `material-design-3-ui`                         |
|------------------------------------|-----------------------------------------------------|
| “Make it look Material”            | Start from user goal, hierarchy, and semantics      |
| Rounded cards everywhere           | Use containment only when it has a purpose          |
| Components chosen by appearance    | Components chosen by behavior                       |
| Random hex values                  | Semantic Material color roles and tokens            |
| Mobile UI stretched to desktop     | Adaptive structure for the available window         |
| Accessibility checked at the end   | Accessibility treated as a release requirement      |
| “Expressive” means more decoration | Expression used selectively to strengthen hierarchy |

This is not a collection of pretty defaults. It is a **decision system for AI agents**.

------------------------------------------------------------------------

## Highlights

- **Progressive disclosure** — a compact `SKILL.md` routes agents to 13 focused references only when needed.
- **Semantic component rules** — buttons, FABs, chips, navigation, forms, feedback, surfaces, and more are selected by purpose.
- **Adaptive by design** — compact through extra-large windows, multi-pane layouts, foldables, resizable windows, and edge-to-edge behavior.
- **Accessibility-first** — contrast, touch targets, focus, keyboard, semantics, text scaling, localization, and reduced motion.
- **M3 Expressive with restraint** — color, shape, size, motion, containment, and typography are used intentionally.
- **Cross-agent distribution** — one package for 7 supported AI agents on Windows, macOS, and Linux.
- **Regression checks** — static validation plus behavioral evaluation cases help prevent rule regressions.

> **Core idea:** Material Design 3 is a semantic, adaptive, accessible design system—not a rounded-card aesthetic.

------------------------------------------------------------------------

## Explore

[**Why it exists**](#why-this-exists) · [**Coverage**](#what-the-skill-covers) · [**Architecture**](#repository-structure) · [**Install options**](#installation) · [**Examples**](#example-tasks) · [**Tests**](#testing-and-regression-checks) · [**Contributing**](#contributing)

------------------------------------------------------------------------

## Why this exists

Material Design 3 is easy to imitate visually and surprisingly easy to apply incorrectly.

A UI can look “Material” while still using the wrong component semantics, weak hierarchy, arbitrary colors, inaccessible controls, broken responsive behavior, excessive cards, or decorative motion that does not communicate anything.

This skill is designed to prevent that.

Instead of telling an agent to simply *“make this look like Material Design 3,”* give it a reusable system that defines **how M3 decisions should actually be made**.

``` text
User goal
   ↓
Information architecture
   ↓
Hierarchy
   ↓
Adaptive layout
   ↓
Semantic tokens
   ↓
Components
   ↓
States & interaction
   ↓
Motion
   ↓
Accessibility
   ↓
Visual expression
```

------------------------------------------------------------------------

## What the skill covers

### Material 3 foundations

- Semantic color roles and surface hierarchy
- Material typography roles
- Shape systems and reusable shape tokens
- Elevation and tonal surface relationships
- Spacing and alignment
- Design tokens
- Light and dark theme behavior
- Dynamic color considerations

### Component selection

The skill teaches agents to choose components by **purpose and behavior**, not by appearance.

Coverage includes:

- Filled, tonal, elevated, outlined, and text buttons
- Icon buttons
- FAB and Extended FAB
- Split buttons and button groups
- Cards
- Lists
- Dividers
- Badges
- Carousels
- Chips
- Checkboxes
- Radio buttons
- Switches
- Segmented buttons
- Navigation bars
- Navigation rails
- Navigation drawers
- Top and bottom app bars
- Tabs
- Text fields
- Search
- Menus
- Sliders
- Date and time pickers
- Dialogs
- Bottom sheets
- Snackbars
- Tooltips
- Progress and loading indicators

### Adaptive UI

The skill treats responsiveness as a structural design problem rather than simply scaling a mobile screen.

It covers:

| Width class | Available width |
|-------------|----------------:|
| Compact     |       `< 600dp` |
| Medium      |     `600–839dp` |
| Expanded    |    `840–1199dp` |
| Large       |   `1200–1599dp` |
| Extra large |      `≥ 1600dp` |

It also guides agents through list-detail layouts, supporting panes, feeds, adaptive navigation, resizable windows, tablets, foldables, desktop-sized layouts, safe areas, and edge-to-edge interfaces.

### Accessibility

Accessibility is treated as a release requirement.

The rules include:

- `48dp × 48dp` minimum Android-oriented touch targets
- Text and UI contrast requirements
- Visible and logical focus
- Keyboard support
- Accessible names for icon-only controls
- Screen-reader semantics
- Text scaling
- Localization resilience
- Reduced-motion support
- Error recovery
- Non-color state communication

### Material 3 Expressive

M3 Expressive is supported as an **optional layer**, not a license to make every screen visually loud.

The skill guides agents in the intentional use of:

- Color
- Shape
- Size
- Motion
- Containment
- Typography
- Shape morphing
- Expressive hierarchy
- Emphasized actions
- Selective visual moments

The core rule is simple:

> **Expression must improve hierarchy, usability, recognition, or emotional clarity.**

------------------------------------------------------------------------

## The anti-“fake Material” rules

This skill explicitly rejects common shortcuts that produce interfaces which only *look* vaguely Material.

``` text
DON'T:
✗ Put every section inside a rounded card
✗ Turn every control into a pill
✗ Use the primary color everywhere
✗ Add shadows to every container
✗ Use chips as generic buttons
✗ Use tabs as unrelated top-level navigation
✗ Add multiple competing FABs
✗ Treat gradients as a shortcut to “Material”
✗ Stretch a phone layout across desktop widths
✗ Animate elements purely for spectacle
✗ Ignore focus, keyboard, text scaling, or reduced motion

DO:
✓ Start from the user's task
✓ Establish information hierarchy first
✓ Use semantic design tokens
✓ Select components by behavior
✓ Design all important states
✓ Adapt structure to available window size
✓ Preserve accessibility
✓ Use expression selectively
```

------------------------------------------------------------------------

## Repository structure

``` text
.
├── SKILL.md
├── skill-files.txt
├── references/
│   ├── accessibility.md
│   ├── adaptive-design.md
│   ├── anti-patterns.md
│   ├── color-system.md
│   ├── component-selection.md
│   ├── feedback-and-overlays.md
│   ├── forms-and-input.md
│   ├── m3-expressive.md
│   ├── motion.md
│   ├── navigation.md
│   ├── shape-and-elevation.md
│   ├── spacing-and-layout.md
│   └── typography.md
├── tests/
│   ├── cases/
│   └── validate_skill.py
├── install.sh
├── install.ps1
├── uninstall.sh
├── uninstall.ps1
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE
└── .github/
```

### Progressive disclosure

`SKILL.md` is intentionally the **decision engine**, not a giant Material 3 textbook.

It routes the agent to focused files under `references/` only when a task needs them. A navigation task can load navigation guidance; a form can load form and accessibility guidance; M3 Expressive guidance is loaded only when expression is relevant.

This reduces unnecessary context while keeping detailed rules available on demand.

`skill-files.txt` defines the portable skill package. The cross-agent installers copy `SKILL.md` plus every referenced package file to the selected host.

## Installation

The fastest install commands are shown at the top of this README. The options below cover selective installation, upgrades, symlinks, and uninstalling.

By default, the universal installer places the skill in the global skill location for every supported host. This avoids false negatives when an IDE is installed without its CLI on `PATH`.

The installer is filesystem-only. It does **not** install, configure, authenticate, or launch any AI agent.

> **Security note:** Piping a remote script directly into a shell is convenient, but review the script first when that matters for your environment. The clone-and-run method below is easier to inspect and pin to a specific commit or release.

### Supported agents

| Agent              | Global installation used by this project                          |
|--------------------|-------------------------------------------------------------------|
| Claude Code        | `~/.claude/skills/material-design-3-ui/`                          |
| OpenAI Codex       | `~/.agents/skills/material-design-3-ui/`                          |
| Google Antigravity | `~/.gemini/config/skills/material-design-3-ui/`                   |
| Kiro               | `~/.kiro/skills/material-design-3-ui/`                            |
| OpenCode           | `~/.config/opencode/skills/material-design-3-ui/`                 |
| Hermes Agent       | `~/.hermes/skills/material-design-3-ui/`                          |
| OpenClaw           | `${OPENCLAW_STATE_DIR:-~/.openclaw}/skills/material-design-3-ui/` |

Every destination receives the same portable skill package: `SKILL.md` plus its progressive-disclosure `references/` files.

### Clone and install

``` bash
git clone https://github.com/skydashnet/material-design-3-ui-skill.git
cd material-design-3-ui-skill
./install.sh
```

Windows:

``` powershell
git clone https://github.com/skydashnet/material-design-3-ui-skill.git
cd material-design-3-ui-skill
.\install.ps1
```

### Install only detected agents

``` bash
./install.sh --detect
```

``` powershell
.\install.ps1 -Detect
```

Detection checks the relevant CLI when available and the host’s existing configuration directory. Universal mode remains the default because it is more reliable for GUI-only installations.

### Install for selected agents

``` bash
./install.sh --agent claude --agent codex --agent antigravity
```

``` powershell
.\install.ps1 -Agent claude,codex,antigravity
```

Supported names: `claude`, `codex`, `antigravity`, `kiro`, `opencode`, `hermes`, `openclaw`.

> **Upgrading from v1.0:** v1.1 installs a multi-file skill package instead of only `SKILL.md`. If an older installation already exists, run the installer with `--force` / `-Force` after reviewing any local edits.

### Updating an existing installation

The installer never silently overwrites a different existing skill directory. Re-run with force after reviewing local changes.

``` bash
./install.sh --force
```

``` powershell
.\install.ps1 -Force
```

If the installed `SKILL.md` is already identical, the installer reports it as up to date and makes no change.

### Symlink mode for contributors

When working from a clone, link each host directly to the repository instead of copying the skill:

``` bash
./install.sh --link
```

``` powershell
.\install.ps1 -Link
```

Windows symbolic links may require Developer Mode or appropriate privileges.

### Uninstall

``` bash
./uninstall.sh
```

``` powershell
.\uninstall.ps1
```

The uninstaller only removes the `material-design-3-ui` skill directories at the supported global destinations.

------------------------------------------------------------------------

## Example tasks

Once the skill is loaded, requests can stay focused on the actual product:

``` text
Redesign this dashboard using Material Design 3.

Audit this mobile screen for incorrect M3 component usage.

Create an adaptive M3 layout for compact, medium, and expanded widths.

Convert this design system to semantic Material 3 color roles.

Review this settings screen for accessibility and hierarchy problems.

Use Material 3 Expressive, but keep the interface suitable for a productivity app.

Create a developer handoff for this screen using semantic M3 tokens and exact component variants.
```

The agent should then apply the rules from `SKILL.md` instead of relying on a vague visual interpretation of Material Design.

------------------------------------------------------------------------

## Testing and regression checks

The repository includes both static validation and behavioral evaluation fixtures.

Run the static validator:

``` bash
python tests/validate_skill.py
```

It checks the skill frontmatter, reference routing, package manifest, installer coverage, repository guardrails, and evaluation fixtures.

`tests/cases/` contains behavioral scenarios for settings, dashboards, adaptive navigation, form validation, M3 Expressive restraint, and fake-Material audits. These cases are designed to catch regressions in **agent decisions**, not merely Markdown formatting.

GitHub Actions runs the static validator and Bash syntax checks on pushes and pull requests.

------------------------------------------------------------------------

## Design philosophy

### Semantics before styling

A component is selected because its behavior matches the task—not because it has the desired shape.

### Tokens before literals

Prefer:

``` text
surface
onSurface
primary
onPrimary
surfaceContainer
outlineVariant
errorContainer
```

over scattered values such as:

``` text
#FFFFFF
#6750A4
23px radius
18px shadow blur
```

Literal values can still exist inside a project’s token implementation, but screens should depend on **semantic roles**.

### Hierarchy before decoration

Spacing, typography, containment, color, shape, and size should communicate importance before decorative effects are introduced.

### Adaptive, not stretched

A wider window should improve context or productivity. It should not simply produce a wider phone screen.

### Accessible by default

Contrast, focus, touch targets, semantics, text scaling, keyboard input, localization, and reduced motion are part of the design—not cleanup work after the design is finished.

### Expressive with restraint

M3 Expressive works best when important moments receive stronger emphasis and routine content remains calm enough to scan.

------------------------------------------------------------------------

## Workflow encoded in `SKILL.md`

``` text
1. Understand the product and platform
2. Establish information architecture
3. Define the primary task and hierarchy
4. Choose the adaptive layout
5. Build the semantic theme
6. Select the correct M3 components
7. Define interaction and system states
8. Apply accessibility requirements
9. Add meaningful motion
10. Apply M3 Expressive treatment when appropriate
11. Review against anti-patterns
12. Produce implementation-ready handoff
```

This ordering matters. Styling is intentionally not the first step.

------------------------------------------------------------------------

## Review contract

Before approving a UI, the skill asks the agent to evaluate:

| Area          | What should be verified                                             |
|---------------|---------------------------------------------------------------------|
| Structure     | Primary task, grouping, hierarchy, navigation vs. actions           |
| Theme         | Semantic colors, typography, shapes, elevation, dark theme          |
| Components    | Correct M3 semantics and variants                                   |
| States        | Loading, empty, error, disabled, selected, pressed, focus, hover    |
| Adaptive      | Compact through large-window behavior                               |
| Accessibility | Targets, contrast, focus, labels, scaling, reduced motion           |
| Expressive    | Whether expression improves the experience rather than adding noise |

This makes the skill useful not only for generating UI, but also for **design reviews and audits**.

------------------------------------------------------------------------

## Intended use

This repository is useful for:

- UI/UX design agents
- AI coding agents
- Product design workflows
- Design-system generation
- Material 3 UI reviews
- Accessibility reviews
- Figma-oriented design specifications
- Android and Jetpack Compose planning
- Web interfaces inspired by Material 3 semantics
- Responsive and adaptive UI planning
- Designer-to-developer handoff

It is especially useful when an agent would otherwise receive a vague instruction such as *“use Material Design 3.”*

------------------------------------------------------------------------

## Platform notes

The design guidance is intentionally broader than a single implementation framework.

For Android and Jetpack Compose, the skill favors current `androidx.compose.material3` guidance, semantic theme roles, adaptive layouts, edge-to-edge behavior, and stable APIs for production unless experimental dependencies are explicitly acceptable.

For web and other platforms, the goal is to preserve M3 semantics, hierarchy, tokens, interaction logic, and accessibility without blindly reproducing Android-specific implementation details.

Library/API availability changes over time. `SKILL.md` therefore instructs agents to verify current official documentation before asserting exact dependency versions or the availability of newer M3 Expressive APIs.

------------------------------------------------------------------------

## Source of truth

This project is based on official Material Design and Android guidance.

- [Material Design 3](https://m3.material.io/)
- [Material 3 Components](https://m3.material.io/components)
- [Material 3 Color Roles](https://m3.material.io/styles/color/roles)
- [Material 3 Typography](https://m3.material.io/styles/typography/overview)
- [Material Design Tokens](https://m3.material.io/foundations/design-tokens/overview)
- [Material Usability & Accessibility](https://m3.material.io/foundations/usability)
- [Material 3 Expressive](https://m3.material.io/blog/building-with-m3-expressive)
- [Google Design research on M3 Expressive](https://design.google/library/expressive-material-design-google-research)
- [Material 3 in Jetpack Compose](https://developer.android.com/develop/ui/compose/designsystems/material3)
- [Adaptive Window Size Classes](https://developer.android.com/develop/adaptive-apps/guides/use-window-size-classes)
- [Canonical Adaptive Layouts](https://developer.android.com/develop/adaptive-apps/guides/canonical-layouts)
- [Android Accessibility](https://developer.android.com/design/ui/mobile/guides/foundations/accessibility)

When this repository and the current official specification disagree, **the current official specification wins**.

------------------------------------------------------------------------

## Contributing

Contributions that improve accuracy, component coverage, accessibility, adaptive behavior, implementation guidance, or compatibility with newer Material 3 guidance are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request.

When proposing a rule change:

1.  Prefer official Material Design or Android documentation as evidence.
2.  Separate design guidance from framework-specific API availability.
3.  Avoid introducing Material 2 behavior as if it were Material 3.
4.  Keep rules semantic and reusable rather than tied to one screenshot or product.
5.  Preserve accessibility requirements.
6.  Explain why the change improves correctness or practical agent behavior.

------------------------------------------------------------------------

## License

Released under the [MIT License](LICENSE).

You may use, copy, modify, merge, publish, and distribute this project under the terms of the license.

------------------------------------------------------------------------

## Disclaimer

This is an **unofficial community project** and is not affiliated with, endorsed by, or sponsored by Google.

Material Design, Material You, Android, and related names are trademarks or products of their respective owners. Official Google documentation remains the source of truth.

------------------------------------------------------------------------

## Make AI-generated Material UI actually behave like Material

If this skill helps your workflow, consider starring the repository and contributing improvements as Material Design 3 continues to evolve.

**Design the system—not just the screenshot.**
