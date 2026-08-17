# Shape and Elevation

Use this reference when defining containers, component identity, hierarchy, overlap, or expressive shape behavior.

## Shape

Shape is a reusable semantic system, not a collection of arbitrary radii.

Rules: - Define a reusable shape scale or tokens. - Components with the same role should use consistent shape logic. - Do not maximize corner radius on every component. - Do not turn every control into a pill. - Avoid radii that differ by a few pixels without semantic purpose. - Use shape contrast only when it clarifies hierarchy, state, or identity. - Decorative shapes must not reduce control recognition or targetability. - Shape morphing may communicate interaction/state when M3 Expressive is enabled, but must remain understandable and performant.

## Elevation

Use elevation to communicate separation, overlap, or hierarchy.

Rules: - Prefer surface/container roles and tonal relationships for routine hierarchy. - Use shadow elevation when physical separation or overlap needs reinforcement. - Avoid decorative shadows on every card or container. - Keep elevation behavior consistent across component states. - Verify elevated content in dark theme. - Do not use elevation as a substitute for information hierarchy.

## Containment

Contain content when grouping is meaningful.

Prefer: - spacing for simple grouping, - dividers for subtle separation, - surface changes for regions, - cards when a unit genuinely benefits from containment.

Avoid nested cards unless the nested containment has a strong semantic reason.

## Review questions

- Does every shape difference communicate something?
- Would removing most shadows preserve the hierarchy?
- Are cards used because content is a contained unit rather than because empty space exists?
- Are expressive shapes selective?
