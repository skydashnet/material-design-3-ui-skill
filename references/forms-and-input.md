# Forms and Input

Use this reference for forms, text fields, settings, validation, selection, and data entry.

## Field choice

- Use filled or outlined text fields according to hierarchy and surrounding containment.
- Use secure/password variants for secrets.
- Use date/time pickers when structured date/time selection reduces errors.
- Use sliders for bounded continuous or stepped values when direct manipulation is useful.
- Use dropdown/exposed menus for contextual option selection when appropriate.
- Use radio buttons for one choice among visible mutually exclusive options.
- Use checkboxes for independent selections.
- Use switches for immediate binary settings.

## Labels and instructions

- Every field needs a persistent clear label or accessible name.
- Placeholder text is supplemental, not the only label.
- Helper text should reduce uncertainty.
- Required/optional status must be understandable.
- Do not rely on iconography alone for unfamiliar input behavior.

## Validation

- Validate at a moment that helps the user recover.
- Error messages should identify the problem and recovery path.
- Preserve entered data after validation errors.
- Move or announce focus appropriately when submission reveals errors.
- Do not use color as the only error signal.
- Avoid blocking submission for warnings that are not actually errors.

## Transactional vs immediate settings

Independent switches normally apply immediately.

Use explicit Save/Apply when: - multiple fields form one transaction, - changes require review before commitment, - server or domain behavior makes immediate application inappropriate, - cancellation/reversion is a meaningful part of the task.

## Keyboard and IME

- Use appropriate input types and actions.
- Keep focused fields visible when the keyboard opens.
- Preserve logical focus order.
- Support hardware keyboard operation where relevant.

## Review questions

- Is the right control used for the data type?
- Is validation recoverable?
- Does the form survive long labels and large text?
- Are immediate and transactional changes clearly distinguished?
