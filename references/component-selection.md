# Material 3 Component Selection

Use this reference whenever choosing or reviewing controls and content containers.

The governing rule is:

> Choose components by purpose and behavior, not by visual resemblance.

## Actions

| Need                            | Preferred component | Guidance                                                      |
|---------------------------------|---------------------|---------------------------------------------------------------|
| Highest-emphasis action         | Filled button       | Reserve strongest emphasis for the primary action in a region |
| Important but softer action     | Filled tonal button | Use when filled primary would overpower hierarchy             |
| Action needing separation       | Elevated button     | Elevation must serve functional separation                    |
| Medium-emphasis alternative     | Outlined button     | Useful beside a stronger primary action                       |
| Low-emphasis contextual action  | Text button         | Context already provides containment                          |
| Compact icon action             | Icon button         | Icon must be recognizable; provide accessible name            |
| Dominant frequent screen action | FAB / Extended FAB  | Must be important and strongly associated with the screen     |
| Default action plus variants    | Split button        | Default and adjacent variants must belong together            |
| Coherent action set             | Button group        | Do not inflate unrelated toolbar actions                      |

Avoid multiple visually dominant filled actions in the same immediate action group.

## Selection and toggles

| Need                             | Component        |
|----------------------------------|------------------|
| Independent binary setting       | Switch           |
| Multiple independent selections  | Checkbox         |
| One mutually exclusive selection | Radio button     |
| Compact single/multi-choice set  | Segmented button |
| Filter a collection              | Filter chip      |
| User-entered entity/tag          | Input chip       |

A switch should normally take effect immediately. Do not add a redundant Save button for a simple independent switch unless the surrounding experience is explicitly transactional.

## Chips

- **Assist chip** — contextual action related to nearby content.
- **Filter chip** — filtering/selecting criteria.
- **Input chip** — user-provided entities, tags, recipients, or tokens.
- **Suggestion chip** — dynamically suggested response/action.

Do not use chips for primary navigation or as a universal replacement for buttons.

## Content and containment

- **List** — continuous collection of related items.
- **Card** — meaningful contained unit with grouped content/actions.
- **Divider** — subtle separation when spacing is insufficient.
- **Badge** — compact status/count attached to another element.
- **Carousel** — horizontally browsable collection where adjacent preview is useful.
- **Surface** — semantic base for custom containers.

Card variants: - filled: tonal containment, - elevated: stronger functional separation, - outlined: grouping with minimal tonal/elevation weight.

Prefer list items over individually carding every row.

## Inputs

- Filled text field
- Outlined text field
- Secure/password field
- Search bar
- Dropdown/exposed menu
- Slider
- Date picker
- Time picker
- Pull to refresh when platform-appropriate

Every input requires a clear label or accessible name. Error text should explain recovery.

## Feedback and overlays

- **Snackbar** — brief non-blocking feedback, optionally one relevant action.
- **Dialog** — blocking decision or focused task that deserves interruption.
- **Bottom sheet** — supplemental actions/content connected to current context.
- **Tooltip** — explanation for unfamiliar/unlabeled controls.
- **Progress indicator** — determinate when progress is knowable; otherwise indeterminate.

Do not use a dialog for routine information that can remain inline. Do not stack modal surfaces.

## Component decision test

Before choosing a component, ask: 1. Is this navigation, action, selection, input, content, or feedback? 2. Is the state immediate or transactional? 3. What is its emphasis relative to nearby controls? 4. Does an established M3/platform control already solve it? 5. What are its disabled, focus, pressed, selected, loading, and error states? 6. Can it be operated and understood accessibly?
