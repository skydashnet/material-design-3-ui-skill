---
description: Design, redesign, review, or implement user interfaces using Google’s Material Design 3 (M3), Material You, and optional Material 3 Expressive principles. Use for UI/UX screens, app flows, design systems, component selection, theming, responsive/adaptive layouts, accessibility audits, Figma-ready specifications, or developer handoff where Material Design 3 is required.
metadata:
  updated: 2026-08-17
  version: 1.0.0
name: material-design-3-ui
---

# Material Design 3 UI/UX

## Purpose

Use this skill to create interfaces that **behave like Material Design 3**, not interfaces that merely look rounded or “Google-like.”

Treat Material 3 as a system:

**user goal → information architecture → hierarchy → adaptive layout → semantic tokens → components → states → interaction → motion → accessibility → visual expression**

M3 Expressive is an optional extension of M3. Use it to improve hierarchy, usability, personality, and emotional clarity; never use it as permission to make every element loud.

## Source-of-truth policy

1.  Prefer the current official Material 3 guidance at `https://m3.material.io/`.
2.  For Android implementation details, prefer `https://developer.android.com/`.
3.  Treat implementation-library status separately from design guidance. A design pattern can exist before a stable API exists on every platform.
4.  When a requested component or behavior may have changed recently, verify the current official specification before asserting exact dimensions, API names, or availability.
5.  Do not silently mix Material 2 rules into Material 3.
6.  Do not treat Pixel screenshots or Google app screenshots as the specification. They are examples, not the source of truth.

## Core behavior

### MUST

- Start from the user’s task, content, hierarchy, and platform before styling.
- Use semantic design tokens instead of arbitrary one-off values.
- Use native M3 components when an appropriate component exists.
- Choose components by purpose and behavior, not by visual resemblance.
- Design all important states: default, pressed, focused, hovered where applicable, selected, disabled, loading, error, empty, and success where relevant.
- Support light and dark themes when the product requires them.
- Preserve readable contrast and accessible interaction targets.
- Design for the available window, not for a guessed device category.
- Respect system bars, safe areas, cutouts, keyboards/IME, foldable hinges, and edge-to-edge layouts where applicable.
- Keep primary actions visually distinguishable from secondary actions.
- Use real content structure or realistic content lengths when evaluating layout.
- Make custom components inherit the same token, state, motion, and accessibility logic as M3 components.
- Explain any deliberate departure from M3 when the product requirement justifies it.

### MUST NOT

- Do not “Materialize” a screen by only adding large corner radii, pastel colors, shadows, or Material Symbols.
- Do not hardcode raw colors throughout screens when semantic roles can be used.
- Do not use color alone to communicate state or meaning.
- Do not use elevation or shadows as decoration on every container.
- Do not wrap every section in a card. Prefer hierarchy, spacing, dividers, and surfaces when containment is unnecessary.
- Do not nest cards repeatedly without a strong semantic reason.
- Do not use FABs for minor, destructive, or ambiguous actions.
- Do not use chips as generic buttons or primary navigation.
- Do not use tabs for unrelated top-level destinations.
- Do not use a navigation bar, rail, and drawer simultaneously unless the information architecture genuinely requires separate navigation levels.
- Do not make all components equally expressive. Emphasis must remain scarce.
- Do not invent a new control if an established M3 or platform control already solves the interaction.
- Do not sacrifice accessibility to preserve a visual composition.
- Do not assume mobile-only behavior on wide, resizable, tablet, foldable, or desktop windows.

## Workflow

Follow this order unless the task explicitly scopes only one stage.

### 1. Understand the product

Identify:

- platform: Android, web, desktop, tablet, foldable, Wear OS, or cross-platform
- primary user goal
- primary action
- top-level destinations
- content hierarchy
- data density
- input method: touch, keyboard, mouse/trackpad, stylus, rotary, or mixed
- brand constraints
- required states and edge cases
- target window sizes
- whether M3 Expressive is desired, appropriate, or explicitly excluded

If a detail is missing but does not block the work, make a conservative M3-aligned assumption and state it. Ask a question only when the missing information materially changes the architecture or interaction.

### 2. Establish information architecture

Before choosing colors or shapes:

- group related information
- separate navigation from actions
- identify the primary task per screen
- remove duplicated controls
- define progressive disclosure for advanced or secondary information
- keep destructive actions separated from routine actions
- avoid showing information merely because space is available

### 3. Choose the adaptive layout

Base layout decisions on available window size.

For Android-style window classes, use these current width ranges as a planning reference:

| Width class | Available width |
|-------------|-----------------|
| Compact     | `< 600dp`       |
| Medium      | `600–839dp`     |
| Expanded    | `840–1199dp`    |
| Large       | `1200–1599dp`   |
| Extra large | `≥ 1600dp`      |

Do not interpret these as permanent device labels. A single device can move between classes due to resizing, rotation, split screen, or folding.

Prefer canonical adaptive patterns when appropriate:

- **List-detail:** collection/list plus selected item detail.
- **Supporting pane:** primary content plus related secondary content/tools.
- **Feed:** repeating content collections where the layout can expand into more columns or richer cards.
- **Adaptive navigation:** change navigation presentation when space and ergonomics justify it.

Rules:

- Compact layouts usually prioritize one main pane at a time.
- Wider layouts should use additional space to improve context or productivity, not merely stretch compact content.
- Keep readable content widths bounded when extremely wide.
- Preserve task continuity when the window resizes.
- Do not hide essential actions only because navigation changes form.
- Test breakpoint boundaries, not only ideal device presets.

### 4. Build the theme from semantic tokens

Use the hierarchy:

**reference/system tokens → semantic/system roles → component tokens**

Never make a screen depend on scattered literal styling values.

## Color

Use M3 color roles according to meaning.

### Primary families

- `primary` / `onPrimary`: highest-emphasis branded actions and content.
- `primaryContainer` / `onPrimaryContainer`: prominent contained areas with less intensity than primary.
- `secondary` / `onSecondary`: supporting emphasis.
- `secondaryContainer` / `onSecondaryContainer`: supporting contained emphasis.
- `tertiary` / `onTertiary`: contrasting accent where useful.
- `tertiaryContainer` / `onTertiaryContainer`: contained tertiary emphasis.

### Surface families

Use surface roles for page and container hierarchy rather than inventing arbitrary gray cards.

Typical roles include:

- `surface`
- `surfaceDim`
- `surfaceBright`
- `surfaceContainerLowest`
- `surfaceContainerLow`
- `surfaceContainer`
- `surfaceContainerHigh`
- `surfaceContainerHighest`
- `onSurface`
- `onSurfaceVariant`
- `outline`
- `outlineVariant`

Use inverse roles only for intentional inverse surfaces.

### Error

Use `error`, `onError`, `errorContainer`, and `onErrorContainer` for actual error/destructive semantics. Do not use error colors merely to attract attention.

### Color rules

- Pair `on*` roles with their intended container role.
- Prefer role changes over hand-tuned opacity hacks.
- Maintain hierarchy in both light and dark themes.
- If dynamic color is supported and desired, treat it as a theme input, not a reason to bypass brand or accessibility review.
- Verify contrast after brand customization.
- Avoid large areas of high-chroma color unless hierarchy and legibility remain strong.

## Typography

M3 organizes type into five semantic groups, each with Large, Medium, and Small roles:

- **Display:** exceptional, highly prominent text.
- **Headline:** major section or screen hierarchy.
- **Title:** component, section, or content titles.
- **Body:** reading and descriptive content.
- **Label:** controls, compact metadata, and utility text.

Rules:

- Choose type by semantic role, not by whichever size visually fits.
- Keep a restrained hierarchy; most screens do not need all 15 roles.
- Do not shrink important text to solve layout problems.
- Allow text scaling and localization expansion.
- Avoid clipping, fixed-height text containers, and fragile single-line assumptions.
- Use emphasized typography selectively when M3 Expressive is enabled.
- Body text should not be smaller than 12sp in Android-oriented designs.

## Shape

Use shape as hierarchy and identity.

Rules:

- Define a reusable shape scale/tokens.
- Components with the same role should use consistent shape logic.
- Use contrasting shapes to create hierarchy only when the contrast has purpose.
- Do not maximize corner radius on every component.
- Avoid random radii that differ by a few pixels without semantic meaning.
- In M3 Expressive, shape morphing may communicate interaction/state, but it must remain understandable and performant.
- Decorative expressive shapes must not make controls harder to recognize or target.

## Elevation and surfaces

Use elevation to communicate separation, overlap, or hierarchy.

- Prefer surface/container roles and tonal relationships for routine hierarchy.
- Use shadow elevation when physical separation/overlap needs reinforcement.
- Avoid decorative shadows on every card.
- Ensure elevated content still reads correctly in dark theme.
- Keep elevation behavior consistent across component states.

## Spacing and alignment

- Use a coherent spacing scale, preferably aligned to a 4dp rhythm for custom layout values.
- Prefer established component padding and layout guidance over arbitrary spacing.
- Increase spacing to express grouping hierarchy before adding extra containers.
- Align related text, icons, and controls to stable visual axes.
- Keep touch targets large even when the visible icon is small.
- Do not force identical spacing everywhere; density follows content and task.

## Component selection

Choose the component whose semantics match the task.

### Actions

| Need                                      | Preferred component | Rules                                                                                        |
|-------------------------------------------|---------------------|----------------------------------------------------------------------------------------------|
| Highest-emphasis action                   | Filled button       | Usually reserve strongest emphasis for the primary action in a region                        |
| Important but softer action               | Filled tonal button | Useful when filled primary would overpower the hierarchy                                     |
| Action needing separation from background | Elevated button     | Use elevation for functional separation, not decoration                                      |
| Medium-emphasis action                    | Outlined button     | Good for alternatives without competing with primary                                         |
| Low-emphasis action                       | Text button         | Use where context already provides containment                                               |
| Compact icon action                       | Icon button         | Use recognizable icons; provide accessible name and tooltip where needed                     |
| Dominant screen-level action              | FAB / Extended FAB  | Use for a frequent, important action strongly associated with the screen                     |
| Action + closely related menu             | Split button        | Prefer when a default action and adjacent variants belong together                           |
| Related action set                        | Button group        | Use when actions form one coherent set; avoid turning all toolbar actions into large buttons |

Avoid multiple visually dominant filled buttons in the same immediate action group.

### Selection and toggles

| Need                                        | Component        |
|---------------------------------------------|------------------|
| Independent binary setting                  | Switch           |
| Multiple independent selections             | Checkbox         |
| One selection from a mutually exclusive set | Radio button     |
| Compact single/multi-choice set             | Segmented button |
| Filter a collection                         | Filter chip      |
| Represent user-entered entity/tag           | Input chip       |

A switch should usually take effect immediately. Do not add a redundant Save button for a simple switch unless the surrounding form is explicitly transactional.

### Chips

- **Assist chip:** contextual action related to nearby content.
- **Filter chip:** filtering or selecting criteria.
- **Input chip:** user-provided entities, tags, recipients, or tokens.
- **Suggestion chip:** dynamically suggested response/action.

Do not use chips for primary navigation or as a universal replacement for buttons.

### Navigation

- **Navigation bar:** top-level destinations when compact bottom navigation is appropriate.
- **Navigation rail:** top-level destinations when horizontal space permits a side navigation treatment.
- **Navigation drawer:** larger or more complex navigation sets, especially where labels/hierarchy need more room.
- **Top app bar:** screen title, navigation affordance, and high-value contextual actions.
- **Bottom app bar:** actions that benefit from bottom reachability; may coordinate with a FAB.
- **Tabs:** switch between peer content views within the same destination/context, not unrelated app destinations.

When adapting navigation, preserve destination identity and selection state across forms.

### Content and containment

- **List:** continuous vertical collection of related items. Prefer list items over individually carding every row.
- **Card:** a meaningful contained unit with grouped content/actions.
- **Divider:** subtle separation when spacing alone is insufficient.
- **Badge:** small status/count attached to another element; do not use for long text.
- **Carousel:** horizontally browsable visual/content collection where previewing adjacent content is useful.
- **Surface:** semantic base for custom containers; inherit theme and state logic.

Card variants:

- **Filled:** contained grouping with tonal separation.
- **Elevated:** needs stronger separation from background.
- **Outlined:** grouping with minimal tonal/elevation emphasis.

### Input

- **Filled text field:** prominent form/input field with filled container treatment.
- **Outlined text field:** input where boundary definition is useful without filled tonal weight.
- **Secure text field:** use platform-supported secure/password variant when available.
- **Search bar:** persistent or prominent search entry and search experience.
- **Dropdown/exposed menu:** choose from a contextual list of actions/options.
- **Slider:** select a value/range from a continuous or stepped range.
- **Date picker:** date selection.
- **Time picker:** time selection; use dial/input variants according to context and accessibility.
- **Pull to refresh:** user-initiated refresh for scrollable content when the platform pattern is appropriate.

Every field needs a clear label or accessible name. Error text must explain how to recover, not merely state “Invalid.”

### Feedback and overlays

- **Snackbar:** brief, non-blocking feedback, optionally with one relevant action.
- **Dialog:** blocking decision or focused task that deserves interruption.
- **Bottom sheet:** supplemental actions/content that remain connected to the current context.
- **Tooltip:** explains an unfamiliar or unlabeled control; not a substitute for essential visible instructions.
- **Progress indicator:** determinate when progress is knowable; indeterminate when it is not.
- **Loading indicator / expressive progress:** use only when supported by the target implementation and appropriate to the experience.

Do not use a dialog for routine information that can live inline. Do not stack multiple modal surfaces.

## M3 Expressive

Enable expressive treatment only when it strengthens the product.

The fundamental expressive levers are:

- color
- shape
- size
- motion
- containment
- typography

### Expressive rules

- Make important actions easier to find, not merely more decorative.
- Use size contrast to establish priority.
- Use shape contrast to distinguish roles or states.
- Use vibrant color where it improves hierarchy and emotional tone.
- Use containment to group related content and isolate key actions.
- Use motion to explain state change, spatial relationship, and response.
- Use emphasized typography selectively.
- Prefer a few strong expressive moments over uniform visual intensity.
- Keep routine reading, forms, settings, and dense productivity areas calmer unless stronger expression demonstrably improves scanning.
- Maintain familiarity: a button must still read as a button, navigation as navigation, and selection as selection.

Potential expressive components/patterns include button groups, split buttons, floating toolbars, expressive list items, updated progress/loading indicators, emphasized typography, richer shape families, and shape-morphing interactions. Verify platform/library support before specifying an implementation API.

## Motion

Motion must communicate.

Use motion to:

- connect origin and destination
- explain hierarchy changes
- acknowledge input
- reveal/hide content
- preserve continuity during navigation or adaptive layout changes

Rules:

- Prefer the M3 motion scheme/tokens when available.
- Keep repeated utility interactions quick and unobtrusive.
- Reserve more expressive spring/shape motion for moments that benefit from it.
- Do not animate everything.
- Avoid motion that delays task completion.
- Respect reduced-motion preferences and accessibility requirements.
- Do not rely on animation as the only explanation of state.

## Interaction states

For every interactive component, consider:

- enabled/default
- hover for pointer interfaces
- focus for keyboard/assistive navigation
- pressed
- selected/checked
- dragged where relevant
- disabled
- loading/busy where relevant
- error where relevant

State changes must remain perceivable without depending solely on color.

## Accessibility

Accessibility is a release requirement, not polish.

### Minimum requirements

- Touch targets: at least `48dp × 48dp` for Android-oriented touch interfaces.
- Text/background contrast: at least `4.5:1` for normal/small text.
- Large text and meaningful non-text graphics: target at least `3:1`.
- Never use color as the only indicator of state.
- Provide accessible names for icon-only controls.
- Decorative imagery should not create noisy screen-reader output.
- Preserve logical focus order.
- Make focus visible.
- Support keyboard interaction where the platform has keyboards.
- Support text scaling without clipping or loss of function.
- Use meaningful labels, helper text, and error recovery guidance.
- Ensure destructive actions are clearly named and difficult to trigger accidentally.
- Consider motor, visual, cognitive, hearing, and situational accessibility.
- Test with realistic localization and longer strings.
- Respect reduced-motion settings.

When using custom components, explicitly define role, state, accessible name, focus behavior, and interaction target.

## Icons and imagery

- Prefer a coherent icon family such as Material Symbols when it matches the product.
- Do not mix unrelated icon styles without a brand reason.
- Do not assume every icon is universally understood.
- Pair ambiguous icons with labels or tooltips.
- Keep icon optical weight appropriate to surrounding typography.
- Use imagery to support content, not to fill empty space.

## Content rules

- Prefer concise, action-oriented labels.
- Button labels should describe the action.
- Avoid vague labels such as “Yes”, “No”, or “OK” when a specific verb is clearer.
- Error messages should state the problem and recovery path.
- Empty states should explain what happened and the next useful action.
- Loading states should preserve context where possible instead of blanking the entire screen.
- Do not use placeholder text as the only field label.

## Common anti-patterns

Reject or revise designs with:

- every section inside a rounded card
- excessive pills/capsules
- arbitrary gradients used as “Material”
- multiple competing FABs
- primary color applied to large amounts of body text
- excessive use of `primaryContainer` for unrelated content
- tiny icon-only controls
- low-contrast gray-on-gray text
- hardcoded light-theme colors in dark mode
- tabs used as top-level app navigation
- chips used as buttons for every action
- navigation that changes destination order between breakpoints
- fixed mobile canvas centered unchanged on desktop
- huge stretched content on wide screens
- custom controls without focus/keyboard/semantics
- motion that exists only for spectacle
- expressive shapes on dense data tables/forms that reduce scanability
- destructive and primary actions styled identically

## Review checklist

Before approving a screen, verify:

### Structure

- Is the primary user task obvious?
- Is information grouped by meaning?
- Is there one clear hierarchy rather than many competing focal points?
- Are navigation and actions distinct?

### Theme

- Are semantic color roles used?
- Are typography roles intentional?
- Are shape and elevation tokens consistent?
- Does dark theme preserve hierarchy?

### Components

- Does every control use the correct M3 component semantics?
- Are custom components actually necessary?
- Are component variants chosen by emphasis rather than aesthetics?

### States

- Are loading, empty, error, disabled, selected, pressed, focus, and hover states covered where relevant?
- Is recovery from errors clear?

### Adaptive

- Does the layout work at compact, medium, expanded, large, and extra-large widths as applicable?
- Does wider space improve the experience rather than only stretch it?
- Does state survive resizing and navigation-form changes?

### Accessibility

- Are touch targets sufficient?
- Is contrast sufficient?
- Is focus order logical and visible?
- Are icon-only actions named?
- Does text scaling/localization remain usable?
- Is reduced motion respected?

### Expressive

- Does expression improve hierarchy, usability, or emotional tone?
- Are expressive moments selective?
- Would the screen still be understandable without decorative effects?

## Output contract

When asked to design, redesign, or audit a UI, produce enough implementation detail that another designer or developer can reproduce the result.

Unless the user asks for another format, include:

1.  **Design intent** — user goal and hierarchy.
2.  **Layout** — regions, panes, navigation, responsive/adaptive behavior.
3.  **Theme roles** — semantic colors, typography roles, shapes, elevation.
4.  **Component map** — exact M3 component type and variant for each important control.
5.  **States** — interaction, loading, empty, error, success, disabled.
6.  **Accessibility** — target size, contrast, labels, focus, keyboard, scaling.
7.  **Motion** — only meaningful transitions and state changes.
8.  **Implementation notes** — platform-specific caveats, especially experimental/unsupported components.

When creating an actual artifact or code, do not stop after describing the design. Apply these decisions to the artifact/code.

## Handoff notation

Prefer semantic names in specifications:

``` text
Screen background: surface
Primary text: onSurface
Secondary text: onSurfaceVariant
Primary CTA: filled button / primary + onPrimary
Secondary CTA: outlined button
Section container: surfaceContainer
Subtle separator: outlineVariant
Error container: errorContainer + onErrorContainer
```

Avoid handoff like:

``` text
Background #F7F7F7
Card #FFFFFF
Purple #6750A4
Radius 23px
Shadow blur 18
```

unless those values are explicitly generated from the project’s token system.

## Platform implementation notes

### Android / Jetpack Compose

- Prefer `androidx.compose.material3` over Material 2 for new M3 work.
- Prefer stable APIs for production unless the user explicitly accepts alpha/experimental dependencies.
- Do not assume every M3 Expressive design API is stable.
- Use Material theme roles rather than raw colors.
- Use Material 3 Adaptive / current Android adaptive guidance for resizable and large-window experiences.
- Treat edge-to-edge and system insets as part of layout design.
- For Wear OS, use the Wear Material 3 library rather than mixing mobile Material 3 components.

As of 2026-08-17, Compose Material 3 stable is `1.4.0`, while the `1.5.0` line is alpha and contains newer Expressive work. Verify the current release before generating dependency versions.

### Web / other platforms

Material 3 design guidance can inform the design even when an official implementation library does not expose every component. In that case:

- reproduce the semantics and token relationships, not Android-specific implementation quirks
- preserve native platform accessibility and input conventions
- clearly mark custom implementations
- do not claim a component is officially available on that platform without verifying it

## Final principle

**Material Design 3 is a semantic, adaptive, accessible design system.**

A successful M3 interface should remain coherent if the brand colors change, the window resizes, dark theme turns on, text scales up, a keyboard replaces touch, or expressive styling is reduced.

If the design only works because every surface is rounded and purple, it is not a robust Material 3 design.

## Official references

- Material Design 3: https://m3.material.io/
- Material 3 components: https://m3.material.io/components
- Material 3 color roles: https://m3.material.io/styles/color/roles
- Material 3 typography: https://m3.material.io/styles/typography/overview
- Material 3 design tokens: https://m3.material.io/foundations/design-tokens/overview
- Material 3 usability/accessibility: https://m3.material.io/foundations/usability
- M3 Expressive: https://m3.material.io/blog/building-with-m3-expressive
- Google research on M3 Expressive: https://design.google/library/expressive-material-design-google-research
- Material 3 in Compose: https://developer.android.com/develop/ui/compose/designsystems/material3
- Adaptive window size classes: https://developer.android.com/develop/adaptive-apps/guides/use-window-size-classes
- Canonical adaptive layouts: https://developer.android.com/develop/adaptive-apps/guides/canonical-layouts
- Compose Material 3 releases: https://developer.android.com/jetpack/androidx/releases/compose-material3
- Android accessibility: https://developer.android.com/design/ui/mobile/guides/foundations/accessibility
