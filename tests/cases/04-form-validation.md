# Evaluation Case: Form Validation

## Prompt

Design a Material 3 account-creation form with name, email, password, date of birth, and terms acceptance.

## Expected decisions

- Use appropriate text/secure fields and date selection.
- Use a checkbox for terms acceptance.
- Keep labels persistent.
- Provide recoverable validation messages near affected fields.
- Preserve entered data after errors.
- Support keyboard/IME, focus order, text scaling, and accessible error semantics.
- Use a clear primary submit action.

## Failure signals

- Placeholder-only labels.
- Error state communicated only by red color.
- Password uses a normal unprotected field.
- Validation clears the form.
- Tiny terms checkbox target.
