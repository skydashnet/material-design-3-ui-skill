# Motion

Use this reference when specifying transitions, feedback, shape morphing, or expressive animation.

## Purpose

Motion must communicate.

Use it to: - connect origin and destination, - explain hierarchy changes, - acknowledge input, - reveal or hide content, - preserve continuity during navigation, - preserve continuity during adaptive layout changes.

## Rules

- Prefer Material motion schemes/tokens when available.
- Keep repeated utility interactions quick and unobtrusive.
- Reserve stronger spring or shape motion for moments that benefit from it.
- Do not animate everything.
- Do not delay task completion for spectacle.
- Do not make motion the only explanation of state.
- Respect reduced-motion preferences.
- Keep spatial transitions consistent with the interface’s navigation model.

## M3 Expressive motion

Expressive motion may add personality through spring behavior, shape changes, or stronger transitions, but it should still explain: - what changed, - where content came from, - what the user’s action affected.

If removing the animation makes the interaction incomprehensible, the static states are under-designed.

## Review questions

- What information does this animation communicate?
- Is the duration proportional to frequency and importance?
- Does reduced motion preserve meaning?
- Does motion preserve spatial continuity?
