# Navigation

Use this reference for destination architecture, app bars, tabs, and adaptive navigation.

## Separate destinations from actions

Navigation changes *where the user is*. Actions change *something in the current context*.

Do not style an action as navigation or navigation as an action merely to achieve a visual composition.

## Components

- **Navigation bar** — top-level destinations when compact bottom navigation is appropriate.
- **Navigation rail** — top-level destinations when horizontal space supports persistent side navigation.
- **Navigation drawer** — larger or more complex destination sets where labels/hierarchy need room.
- **Top app bar** — screen title, navigation affordance, and high-value contextual actions.
- **Bottom app bar** — actions benefiting from bottom reachability; may coordinate with a FAB.
- **Tabs** — peer content views inside the same destination/context.

## Rules

- Do not use tabs for unrelated top-level destinations.
- Do not show bar, rail, and drawer simultaneously merely because the window is wide.
- Preserve destination identity and selection state when navigation changes form.
- Keep destination order stable across breakpoints unless the information architecture itself changes.
- Do not hide essential actions when navigation presentation changes.
- Avoid placing destructive actions beside routine navigation without clear separation.
- Back/up behavior should follow platform and hierarchy expectations.

## Adaptive navigation

Changing from bottom navigation to rail/drawer is a presentation change, not permission to redefine the app architecture.

Test: - compact, - breakpoint boundaries, - landscape, - resizable windows, - keyboard/pointer navigation, - restoration after resize.

## Review questions

- Are top-level destinations obvious?
- Are tabs truly peer views?
- Is selection persistent across layout changes?
- Are actions visually distinct from destinations?
