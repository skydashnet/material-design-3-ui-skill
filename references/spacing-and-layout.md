# Spacing and Layout

Use this reference for grouping, alignment, density, readable widths, safe areas, and responsive structure.

## Spacing

- Use a coherent spacing scale; a 4dp rhythm is a useful planning baseline for custom Android-oriented layout values.
- Prefer established component padding before inventing custom values.
- Use spacing to express grouping before adding containers.
- Related elements should align to stable visual axes.
- Density should follow the task; do not force identical spacing everywhere.
- Keep interaction targets large even when visible icons are small.

## Layout

Start from content and task hierarchy.

- Separate navigation from actions.
- Keep the primary task easy to locate.
- Use progressive disclosure for secondary or advanced content.
- Bound readable content widths on very wide windows.
- Respect safe areas, system bars, cutouts, keyboards/IME, and foldable hinges.
- Preserve task continuity when resizing.
- Do not stretch a compact layout unchanged across a desktop-sized window.
- Do not add content merely because space is available.

## Wide-window behavior

Additional width should improve: - context, - comparison, - navigation persistence, - productivity, - preview/detail relationships, - supporting information.

It should not simply increase line length or empty horizontal padding.

## Review questions

- Is grouping obvious without excessive cards?
- Are major axes aligned?
- Does the layout survive long content?
- Does wider space improve the experience?
- Are system insets and input surfaces accounted for?
