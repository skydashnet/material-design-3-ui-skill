# Material 3 Color System

Use this reference when defining, reviewing, or translating a UI color system.

## Principle

Color must communicate semantic role and hierarchy. Do not assign colors to components merely because they look attractive in isolation.

## Core role families

### Primary

- `primary` / `onPrimary`: highest-emphasis branded actions and content.
- `primaryContainer` / `onPrimaryContainer`: prominent contained emphasis with lower intensity.
- Do not apply `primary` to large amounts of body text or unrelated containers.

### Secondary

- `secondary` / `onSecondary`: supporting emphasis.
- `secondaryContainer` / `onSecondaryContainer`: supporting contained emphasis.

### Tertiary

- `tertiary` / `onTertiary`: contrasting accent when a third emphasis family is useful.
- `tertiaryContainer` / `onTertiaryContainer`: contained tertiary emphasis.

### Surface

Use the surface family to establish routine container hierarchy: - `surface` - `surfaceDim` - `surfaceBright` - `surfaceContainerLowest` - `surfaceContainerLow` - `surfaceContainer` - `surfaceContainerHigh` - `surfaceContainerHighest` - `onSurface` - `onSurfaceVariant` - `outline` - `outlineVariant`

Prefer surface-role changes, spacing, and containment over inventing arbitrary gray cards.

### Error

Use `error`, `onError`, `errorContainer`, and `onErrorContainer` for actual error or destructive semantics. Do not use error colors merely to attract attention.

## Rules

- Pair `on*` roles with their intended background/container roles.
- Use semantic roles in screen specifications instead of raw hex values.
- Literal values belong inside the project’s token implementation, not scattered across screens.
- Verify hierarchy in light and dark themes.
- Verify contrast after brand customization.
- Dynamic color is a theme input, not permission to bypass brand or accessibility review.
- Avoid high-chroma color over large areas when it harms readability or hierarchy.
- Do not communicate selected, error, warning, or success state with color alone.
- Do not assume a specific default Material purple is required for Material 3.

## Handoff example

Prefer:

``` text
Screen background: surface
Primary text: onSurface
Secondary text: onSurfaceVariant
Primary CTA: primary + onPrimary
Section container: surfaceContainer
Subtle divider: outlineVariant
Error region: errorContainer + onErrorContainer
```

Avoid:

``` text
Background: #F7F7F7
Card: #FFFFFF
Purple: #6750A4
```

unless those literals are generated from the project’s token system.

## Review questions

- Is every important color tied to a semantic role?
- Are content/background pairs intentional?
- Does dark theme preserve hierarchy?
- Are selected and error states understandable without color?
- Is primary color scarce enough to preserve emphasis?
