# Contributing to Material Design 3 UI/UX Skill

Thanks for helping improve this project.

The goal of this repository is to give AI design and coding agents a practical, accurate, and maintainable set of rules for applying Google Material Design 3 (M3), Material You, and optional Material 3 Expressive principles.

Contributions are welcome when they improve correctness, clarity, accessibility, adaptive behavior, component coverage, or real-world usefulness.

## Before contributing

Please keep these principles in mind:

1.  **Official guidance wins.** Prefer current Material Design 3 and Android documentation over screenshots, blog interpretations, or remembered Material 2 behavior.
2.  **Separate design guidance from API availability.** A valid M3 pattern may exist before a stable implementation API exists on every platform.
3.  **Semantics before aesthetics.** Rules should explain why and when a component or token is used—not merely how it looks.
4.  **Accessibility is not optional.** Do not weaken accessibility requirements for visual consistency.
5.  **Avoid product-specific rules.** The skill should remain reusable across products and agent environments.
6.  **Keep M3 Expressive intentional.** Expressive treatment should improve hierarchy, usability, recognition, or emotional clarity rather than add noise.

## Good contributions

Examples include:

- Correcting an inaccurate Material 3 rule
- Updating guidance after an official M3 specification change
- Improving component-selection rules
- Adding missing interaction states or edge cases
- Improving adaptive layout guidance
- Improving accessibility requirements
- Clarifying Android, Compose, web, or cross-platform implementation notes
- Adding useful anti-patterns
- Improving the review checklist or handoff contract
- Fixing ambiguous language that causes agents to make poor UI decisions

## Changes that need extra care

Please explain the rationale clearly when a change:

- introduces a custom component recommendation
- changes an accessibility requirement
- changes adaptive breakpoint guidance
- recommends an alpha or experimental API
- adds platform-specific behavior
- changes the meaning of an existing MUST or MUST NOT rule
- adds new M3 Expressive behavior

Whenever possible, link to the relevant official source.

## Development workflow

1.  Fork the repository.
2.  Create a focused branch.
3.  Make the smallest change that fully solves the problem.
4.  Review `SKILL.md` for contradictions introduced by the change.
5.  Verify Markdown formatting and links.
6.  Open a pull request using the repository template.

Example:

``` bash
git checkout -b docs/improve-navigation-guidance
```

Keep unrelated changes in separate pull requests.

## Editing `SKILL.md`

`SKILL.md` is the core artifact of this repository.

When editing it:

- preserve valid YAML frontmatter
- keep the skill name stable unless a breaking rename is intentional
- use clear imperative language for operational rules
- use **MUST**, **MUST NOT**, **SHOULD**, and **MAY** only when the strength of the rule matters
- prefer semantic M3 names over arbitrary literal values
- avoid duplicating the same rule across many sections
- keep examples implementation-oriented
- distinguish timeless design principles from version-sensitive implementation details
- add a verification note when guidance may change with library releases

## Source quality

Preferred sources, in order:

1.  [Material Design 3](https://m3.material.io/)
2.  [Android Developers](https://developer.android.com/)
3.  [Google Design](https://design.google/)
4.  Official framework/library release notes

Third-party articles may help identify an issue, but normative rules should be grounded in official guidance whenever possible.

## Pull request expectations

A good pull request should explain:

- what changed
- why the change is needed
- which part of M3 it affects
- whether it changes agent behavior
- whether it is platform-specific
- the official source supporting the change, when applicable

For substantial rule changes, include a short before/after example showing how an agent’s decision should improve.

## Style

Write for both designers and AI agents.

Prefer:

> Use a navigation bar for compact top-level destinations when bottom navigation is appropriate.

Avoid:

> Navigation bars are cool and usually look better on phones.

Rules should be concise enough to follow but specific enough to prevent common misinterpretations.

## Reporting incorrect guidance

If you find a rule that conflicts with current official Material guidance, please open a **Material guidance correction** issue and include the official source.

Correctness issues are high priority.

## License

By contributing, you agree that your contributions will be licensed under the repository’s [MIT License](LICENSE).
