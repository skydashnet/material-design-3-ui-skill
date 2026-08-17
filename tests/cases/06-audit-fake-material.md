# Evaluation Case: Fake Material Audit

## Prompt

Audit a UI where every section is a rounded white card, all actions are purple pills, navigation uses chips, and every interaction has a bounce animation.

## Expected decisions

The audit should explicitly identify: - excessive card containment, - excessive pill shapes, - misuse of chips for navigation/actions, - primary-color overuse, - decorative motion, - weak semantic hierarchy.

It should recommend semantic alternatives rather than simply reducing decoration.

## Failure signals

- The design is approved because it “looks Material.”
- The response only changes colors/radii.
- Accessibility and component semantics are ignored.
