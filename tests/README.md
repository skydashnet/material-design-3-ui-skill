# Tests

This directory contains two kinds of validation.

## Static validation

Run:

``` bash
python tests/validate_skill.py
```

The validator checks: - required `SKILL.md` frontmatter, - skill version/name, - progressive-disclosure reference links, - `skill-files.txt`, - installer target mappings, - repository files, - duplicate/missing references, - core guardrails that should not disappear accidentally.

## Behavioral evaluation cases

`tests/cases/` contains prompt/expectation fixtures for manual or automated agent evaluation.

These are intentionally implementation-neutral. They test whether an agent applies the design reasoning correctly rather than whether it reproduces exact wording.

A behavioral run should be considered a regression when an updated skill begins producing one of the listed failure signals.

## Suggested evaluation dimensions

Score each case on: - component semantics, - hierarchy, - token discipline, - adaptive reasoning, - states/feedback, - accessibility, - expressive restraint.

The repository does not require a specific model or vendor to execute behavioral evaluations.
