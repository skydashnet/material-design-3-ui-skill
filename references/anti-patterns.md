# Material 3 Anti-Patterns

Use this reference during audits and before final approval.

Reject or revise designs with these patterns unless a strong product requirement justifies them.

## Fake-Material styling

- Every section is inside a rounded card.
- Every control is a pill/capsule.
- Arbitrary gradients are used as a shortcut to “Material.”
- Default-looking Material purple is applied everywhere without semantic reasoning.
- Shadows are added to every container.
- Material Symbols are treated as sufficient proof of M3 compliance.

## Component misuse

- Multiple competing FABs.
- Chips used as generic buttons.
- Chips used as primary navigation.
- Tabs used for unrelated top-level destinations.
- Multiple visually dominant filled buttons in one immediate action group.
- A switch plus redundant Save button for a simple immediate setting.
- Custom controls recreate established platform/M3 behavior without a reason.
- Destructive and routine primary actions are styled identically.

## Layout problems

- Every list row becomes a card.
- Cards are nested repeatedly.
- A fixed mobile canvas is centered unchanged on desktop.
- Content stretches to huge line lengths on wide screens.
- Navigation destination order changes unpredictably between breakpoints.
- Essential actions disappear during adaptive navigation changes.
- Safe areas, IME, or foldable hinges are ignored.

## Accessibility failures

- Tiny icon-only controls.
- Low-contrast gray-on-gray text.
- Color is the only state indicator.
- Focus is invisible or illogical.
- Custom controls lack semantics/keyboard behavior.
- Text clips at larger sizes.
- Motion ignores reduced-motion preferences.

## Expressive misuse

- Every component is equally colorful, large, or animated.
- Shape morphing is decorative and harms recognition.
- Dense forms/data tables use excessive expressive shapes.
- Motion exists only for spectacle.
- Typography competes with content instead of clarifying hierarchy.

## Audit response

When identifying an anti-pattern: 1. name the underlying problem, 2. explain the user or system consequence, 3. recommend the semantic M3 alternative, 4. distinguish required correction from optional refinement.
