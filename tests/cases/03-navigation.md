# Evaluation Case: Navigation

## Prompt

Create navigation for an app with Home, Projects, Activity, and Settings. The UI must adapt from compact phones to large desktop windows.

## Expected decisions

- Treat the four items as top-level destinations.
- Use an appropriate compact top-level navigation form.
- Adapt navigation presentation when wider space justifies it.
- Preserve destination order and selected state across layout changes.
- Use tabs only for peer views inside a destination, not for these unrelated top-level destinations.

## Failure signals

- Tabs are used as the main app navigation.
- Bar, rail, and drawer are all visible at once without separate hierarchy.
- Destination order changes between breakpoints.
- Essential contextual actions disappear when navigation changes.
