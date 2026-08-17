# Feedback and Overlays

Use this reference for status, loading, errors, dialogs, sheets, snackbars, and transient UI.

## Snackbar

Use for brief non-blocking feedback tied to a recent event.

- Keep text concise.
- Include at most one highly relevant action when appropriate.
- Do not use a snackbar for information the user must acknowledge before continuing.
- Do not hide persistent errors only in a transient snackbar.

## Dialog

Use when interruption is justified by: - a blocking decision, - confirmation with meaningful consequences, - a focused task that cannot remain inline.

Avoid dialogs for routine explanations or low-value acknowledgements.

## Bottom sheet

Use for supplemental content/actions that remain connected to the current context.

Do not stack a sheet on top of another modal surface unless the interaction has a compelling reason and remains understandable.

## Loading and progress

- Use determinate progress when progress can be measured.
- Use indeterminate progress when it cannot.
- Preserve context during loading when possible.
- Avoid blanking the entire screen for small local operations.
- Prevent duplicate destructive/transactional submissions while busy.
- Announce meaningful loading changes accessibly where needed.

## Empty states

Explain: 1. what the state means, 2. whether it is expected, 3. the next useful action when one exists.

Do not fill empty states with decorative content that obscures recovery.

## Errors and success

- Place recoverable errors near the affected context.
- Use clear action-oriented recovery.
- Success feedback should match the importance of the completed action.
- Do not use color alone.

## Review questions

- Is interruption proportional to importance?
- Is transient feedback used only for transient information?
- Does loading preserve context?
- Can the user recover from errors without losing work?
