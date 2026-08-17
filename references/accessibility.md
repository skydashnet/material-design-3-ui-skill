# Accessibility

Use this reference for every design review. Accessibility is a release requirement, not optional polish.

## Interaction targets

For Android-oriented touch interfaces, target at least `48dp × 48dp` for interactive touch areas.

A visible icon may be smaller while its hit target remains large enough.

## Contrast

Use current platform/WCAG-aligned guidance as the source of truth.

Planning targets: - normal/small text: at least `4.5:1`, - large text and meaningful non-text graphics: at least `3:1`.

Verify actual theme combinations rather than assuming token usage guarantees sufficient contrast after brand customization.

## Semantics

- Every icon-only control needs an accessible name.
- Decorative imagery should not create noisy screen-reader output.
- Custom components must define role, state, name, focus behavior, and target.
- State must not be communicated only by color.
- Error messages must be perceivable and associated with affected controls.

## Focus and keyboard

- Preserve logical focus order.
- Make focus visible.
- Support keyboard interaction where keyboards are part of the platform.
- Do not create keyboard traps.
- Modal surfaces must manage focus predictably.

## Text and localization

- Support text scaling without clipping or loss of function.
- Avoid fixed-height text containers.
- Test longer translated strings.
- Do not depend on English word length or left-to-right layout assumptions when the product localizes broadly.

## Motion

- Respect reduced-motion preferences.
- Do not make animation the only explanation of state.
- Avoid motion likely to impair task completion or comprehension.

## Cognitive and motor considerations

- Use clear labels and predictable patterns.
- Keep destructive actions explicit and difficult to trigger accidentally.
- Avoid tiny densely packed targets.
- Preserve entered data when recoverable errors occur.
- Keep error recovery concrete.

## Accessibility review

Before approval, verify: - touch targets, - contrast, - focus visibility/order, - accessible names, - screen-reader semantics, - keyboard operation, - text scaling, - localization, - non-color state communication, - reduced motion.
