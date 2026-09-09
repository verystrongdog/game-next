# Current Design Fragments

- Protocol version: `0.1`
- Status: active minimal process
- Accepted fragments: none

This directory holds only design that is accepted enough to guide the current
playable. It is not a complete GDD and is not a destination for wholesale copies
of the legacy repository.

## Promote only the needed fragment

When legacy notes or a discussion contain something needed by the current Slice:

1. Cite the exact repository, commit or document version, file, heading, and
   paragraph or other stable locator.
2. Separate what the owner accepts now from what is rejected, obsolete, or still
   unknown.
3. Express the accepted fragment as an experience intent plus concrete examples,
   rules, states, boundaries, or tunable ranges sufficient for the next work.
4. Name the current playable scene or experiment that can challenge it.
5. Record the owner decision in the promoting Issue and commit the fragment.
6. Link the fragment from `PLAYABLE.md` or the implementing Issue instead of
   copying it again.

One long source may yield several small fragments at different times. Never grant
authority to the rest of the source merely because one fragment was accepted.

## Fragment template

Create `docs/design/<topic>.md` with the smallest applicable subset:

```markdown
# <Topic>

- Status: accepted | experimental | retired
- Applies to playable: <PLAYABLE revision and Slice Issue>
- Decision source: <Issue and owner decision>
- Legacy/source locator: <exact path, revision, heading, paragraph>

## Experience intent
## Accepted examples
## Rules, states, and boundaries
## Tunable envelope
## Unknown or explicitly unaccepted
## Playable validation scene
```

The Git commit containing an accepted fragment is its durable revision. A later
semantic change requires an admitted Issue and a new commit; do not use an Issue
comment as the only current design authority.

## Change notes

- `0.1` — 2026-09-09: Defined demand-driven promotion of design fragments without
  importing an entire legacy design document.
