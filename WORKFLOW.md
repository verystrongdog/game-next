# Game Development Workflow

- Protocol version: `0.2`
- Status: active
- Owner: repository owner
- Last revised: 2026-09-09

## Purpose

The repository exists to produce and improve a playable game. Process is useful
only when it helps the project choose the right playable change, implement it
safely, or learn from play.

This file is the canonical entry point for repository workflow. Detailed
procedures live under `docs/workflow/` and are subordinate to this file.

## Authority order

The repository owner is the decision authority, but a conversation is not a
durable source. Record an owner decision in the appropriate canonical artifact
before it authorizes implementation. When persisted artifacts disagree, resolve
them in this order:

1. Accepted current-design documents and accepted ADRs, for game behavior and
   durable decisions.
2. [`PLAYABLE.md`](PLAYABLE.md), for current production priority, scope, cut
   line, and accepted placeholders.
3. The approved revision of the active Issue, for the local work it governs.
4. Executable evidence: tests, builds, recordings, saves, and playtest results.
5. Discussion threads and raw notes.
6. The legacy repository and its documents.

Lower-ranked material may reveal a conflict but may not silently override a
higher-ranked source. Evidence that falsifies current design requires an explicit
owner decision and canonical revision; it does not silently rewrite authority.

## Non-negotiable rules

1. **Playable outcome over administrative output.** A collection of correct
   documents or individually completed Issues is not success unless it advances
   the current playable target or produces evidence needed to choose it.
2. **One current playable target.** Use `PLAYABLE.md` to name the integrated
   player journey being built or investigated now. A local Issue goal is not a
   substitute for that integrated target.
3. **Raw discussion is not an implementation order.** Ideas, chat, legacy
   documents, screenshots, and comments must pass through the applicable Issue
   process before production implementation begins.
4. **Strictness follows uncertainty and delivery risk.** Bugs are strict about reproduction;
   experiments about question, evidence, and stopping conditions;
   implementations about approved behavior and scope; RFCs about alternatives,
   consequences, and reversibility. Small reversible work does not require the
   same admission cost as data loss, core rules, or cross-system change.
5. **Do not manufacture certainty.** Unknown game feel, balance, and experience
   remain hypotheses until play produces evidence. They must not be rewritten as
   arbitrary objective requirements merely to satisfy a template.
6. **One fact, one canonical home.** An Issue describes one proposed change or
   investigation. Accepted durable design belongs in current-design documents or
   ADRs; other artifacts link to it instead of copying it.
7. **Approval binds an exact specification revision or iteration envelope.** A substantive edit to an
   approved Issue invalidates admission and returns it to review.
   Parameter changes explicitly allowed by an admitted experiment envelope are
   evidence records, not specification edits.
8. **Evidence beats reports.** Agent summaries and checklist claims are not proof.
   Inspect the repository, run the checks, and play the relevant build.
9. **Integrated beats locally complete.** Code, content, or assets being finished
   does not mean the target is playable, playtested, or creatively accepted.
10. **Limit work in progress.** Do not admit work merely because it is well
   specified. It must have a relationship to the current playable target and
   fit available capacity.

## Workflow modules

| Module | Status | Canonical document |
| --- | --- | --- |
| Current playable selection, scope, and cut line | Active v0.1 | [`PLAYABLE.md`](PLAYABLE.md) |
| Issue intake, clarification, admission, and revision | Active v0.2 | [`docs/workflow/issues.md`](docs/workflow/issues.md) |
| Current-design fragment promotion | Active v0.1 | [`docs/design/README.md`](docs/design/README.md) |
| Pull requests and code review | Not yet defined | Future module |
| Automated verification and CI | Not yet defined | Future module |
| External playtest operations and research | Not yet defined | Future module |
| Release and build retention | Not yet defined | Future module |
| Full ADR maintenance | Not yet defined | Future module |

“Not yet defined” is intentional. Until a module is added, do not invent a
permanent rule and present it as repository policy. Record a local decision in
the active Issue and propose a workflow change if it recurs.

## Top-level flow

```text
observation / idea / defect
        |
        v
discussion or evidence capture
        |
        v
select or revise the current playable Slice
        |
        v
typed Experiment / Implementation / Task / Bug / RFC
        |
        v
risk-sized clarification and admission
        |                         |
        |                         +--> blocked / rejected
        v
status:ready (bound to one specification revision)
        |
        v
prototype or production work
        |
        v
integrate into the named build and play it
        |
        v
accept / iterate / cut / abandon / record debt
```

## Changing the workflow

- Fixing an obvious typo that does not change meaning may be committed directly.
- Any semantic change must explain the observed failure or new constraint that
  motivates it.
- Update the canonical module and every executable mirror (Issue Forms or
  automation) together.
- Increment the affected protocol version and append a dated change note.
- Never change workflow merely to make a current non-conforming task appear
  compliant. Resolve the task first, then evaluate the rule independently.

## Change notes

- `0.1` — 2026-09-09: Established modular workflow authority and the Issue
  lifecycle as the first active module.
- `0.2` — 2026-09-09: Added the current playable target, risk-sized admission,
  integrated production work, and minimal current-design fragment promotion.
