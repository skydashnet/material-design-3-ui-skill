# Evaluation Case: Settings Screen

## Prompt

Design a Material 3 notification settings screen with independent toggles for email notifications, push notifications, weekly summary, and marketing messages.

## Expected decisions

- Use switches for independent immediate binary settings.
- Keep labels persistent and understandable.
- Use list/section hierarchy instead of wrapping every setting in a card.
- Define enabled, disabled, focus, pressed, and loading behavior where relevant.
- Keep touch targets accessible.
- Avoid a redundant Save button unless the product explicitly makes the settings transactional.

## Failure signals

- Checkboxes used merely because they are visually preferred.
- Every row becomes an elevated card.
- Tiny switches or icon-only controls.
- A Save button is added without transactional semantics.
- Selected state depends only on color.
