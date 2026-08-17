# Adaptive Design

Use this reference for responsive, resizable, tablet, foldable, desktop-sized, or multi-pane Material 3 interfaces.

## Core principle

Design for the **available window**, not a guessed device category.

A single physical device can cross size classes because of rotation, split screen, resizing, or folding.

## Width planning reference

| Width class | Available width |
|-------------|----------------:|
| Compact     |       `< 600dp` |
| Medium      |     `600–839dp` |
| Expanded    |    `840–1199dp` |
| Large       |   `1200–1599dp` |
| Extra large |      `≥ 1600dp` |

Treat current official Android adaptive guidance as the source of truth if these ranges change.

## Canonical patterns

### List-detail

Use when users browse a collection and inspect one item.

Compact: - usually one pane at a time.

Wider: - list and detail can coexist when it improves continuity.

### Supporting pane

Use when primary content benefits from persistent related information or tools.

The supporting pane must be useful, not filler.

### Feed

Use for repeating collections that can become richer or multi-column with more space.

Do not destroy reading order merely to fill columns.

### Adaptive navigation

Change navigation presentation when space and ergonomics justify it while preserving destination identity.

## Rules

- Wider layouts should improve context or productivity.
- Bound readable line lengths.
- Preserve selected item, scroll position, input, and task state where appropriate during resize.
- Respect fold/hinge occlusion.
- Test breakpoint boundaries, not only ideal presets.
- Do not assume landscape equals expanded.
- Do not hide essential actions because navigation moved.
- Avoid a fixed phone canvas centered unchanged on desktop.

## Review matrix

Test at minimum: - just below a breakpoint, - exactly at/just above it, - narrow landscape, - wide window, - text scaling, - keyboard/IME visible, - pointer and keyboard input where relevant.
