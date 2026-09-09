# Issue Process

- Protocol version: `0.1`
- Parent authority: [`WORKFLOW.md`](../../WORKFLOW.md)
- Status: active
- Last revised: 2026-09-09

## 1. Purpose

An Issue is an admitted unit of investigation or change. It is not an idea dump,
the complete game design, or proof that work is valuable.

This process converts uncertain input into one of four explicit contracts while
preventing premature certainty:

- a reproducible defect contract;
- a design experiment contract;
- an implementation contract bound to accepted design;
- an RFC contract for a consequential decision.

## 2. Artifact boundaries

| Artifact | Role | Authority |
| --- | --- | --- |
| Discussion/chat/raw note | Capture observations, ideas, disagreement | Evidence only |
| Legacy document | Historical evidence and candidate reasoning | Never current by default |
| Issue | One investigation or change contract | Authoritative only for that work item and approved revision |
| Current-design document | Current accepted player/game behavior | Durable design authority |
| ADR | Accepted consequential technical/design decision and consequences | Durable decision authority |
| PR/build/test/playtest | Implementation and verification evidence | Evidence, not a substitute for design authority |

Do not copy the same rule into several artifacts. Link to the canonical source
and record only the local implication needed by the Issue.

## 3. Issue types

### 3.1 Bug

Use when observed behavior contradicts an already accepted expectation.

Strict about:

- exact build or commit;
- platform and relevant environment;
- preconditions, save/scene/seed/mod state;
- actual versus expected behavior;
- reproduction steps and frequency;
- logs, screenshots, video, replay, or save when relevant.

A disagreement about desired behavior is not automatically a bug. If the
expected behavior is not already accepted, route it to an experiment or RFC.

### 3.2 Design experiment

Use when the problem or opportunity is credible but the correct game design is
unknown.

Strict about:

- player observation and source;
- the single question being tested;
- a falsifiable hypothesis;
- the smallest prototype that can answer it;
- fixed playtest scenario and evidence to collect;
- stopping conditions and the decision owner;
- explicit non-goals.

Not strict about a final mechanic that evidence does not yet support. A completed
experiment may accept, revise, reject, or leave the hypothesis unresolved.
“Prototype exists” is not the same as “design accepted.”

### 3.3 Implementation

Use only when the intended behavior has already been accepted.

Strict about:

- relationship to the current playable milestone;
- canonical design/ADR/accepted experiment and exact revision;
- player-visible behavior;
- preconditions, action, observable results, rules, and edge cases;
- presentation feedback needed for player understanding;
- playable verification scenario;
- affected boundaries, dependencies, and non-goals.

An implementation Issue with an unresolved plan-shaping design question is not
ready. Reclassify or split it instead of allowing the implementer to decide
silently.

### 3.4 RFC

Use for consequential or difficult-to-reverse decisions: Core/Unity ownership,
save compatibility, data formats, cross-system contracts, major control or camera
models, or workflow governance.

Strict about:

- the decision and current constraint;
- at least two credible options, including “do nothing” when meaningful;
- evidence and assumptions;
- consequences, migration, rollback, and affected boundaries;
- what decision or ADR will close the RFC.

An RFC authorizes discussion and bounded prototypes, not production
implementation, until accepted.

## 4. Lifecycle and labels

Type and status are independent. Every open Issue has exactly one `type:*` and
one `status:*` label.

Type labels:

- `type:bug`
- `type:experiment`
- `type:implementation`
- `type:rfc`

Status labels:

- `status:triage` — draft exists but is not authorized for work;
- `status:blocked` — admission failed pending information, evidence, or decision;
- `status:ready` — admitted at an exact specification revision;
- `status:in-progress` — admitted work has started;
- `status:verify` — claimed result awaits direct verification.

Optional blocking-reason labels may coexist:

- `needs:clarification`
- `needs:evidence`
- `needs:decision`
- `needs:admission-review`

Closed state expresses the final result; do not add a redundant `status:done`.
Close with a resolution comment: accepted, duplicate, rejected, obsolete, or
inconclusive.

```text
create form
    |
    v
status:triage
    |
    +--> status:blocked + needs:clarification/evidence/decision
    |          |
    |          +--> revise -> status:triage
    |
    +--> rejected/duplicate/obsolete -> close with reason
    |
    v
status:ready -> status:in-progress -> status:verify
                                         |
                                         +--> accepted -> close
                                         +--> implementation defect -> in-progress
                                         +--> specification change -> triage, new revision
```

## 5. Clarification protocol

The clarifier helps the owner express a decision; it does not make the decision.

1. Preserve the raw source link, attachment, or exact observation.
2. Identify the Issue type before demanding type-specific detail.
3. Scan the applicable dimensions:
   - player and play moment;
   - player action or decision;
   - loop start, continuation, and end;
   - state transitions, numerical boundaries, and failure cases;
   - visual, audio, camera, input, and UI feedback;
   - interaction with existing mechanics and data;
   - platform/content scope;
   - evidence, verification, and non-goals.
4. Ask at most two or three plan-shaping questions per round. Follow an answer
   depth-first when it exposes another decision.
5. Offer concrete alternatives and trade-offs when they are known, but do not
   select on behalf of the owner.
6. Do not fill required fields with invented assumptions, `N/A`, “as appropriate,”
   or arbitrary metrics.
7. If an experience claim cannot yet be verified, formulate a design experiment
   rather than an implementation Issue.
8. Render the complete typed draft and obtain explicit owner confirmation.
9. Confirmation advances the draft to admission review, not directly to work.

References such as “the red box,” “that document,” or “same as before” are
inadmissible without a textual locator and stable link. Media remains attached as
evidence; the text explains what part matters without pretending to replace it.

## 6. Universal admission conditions

An Issue cannot become `status:ready` unless all applicable conditions pass:

- type is correct and unambiguous;
- it identifies its relationship to the current playable milestone;
- the owner explicitly confirmed the complete draft;
- source evidence is linked or embedded;
- non-goals contain at least one meaningful exclusion;
- completion produces an observable result or a bounded decision;
- dependencies and affected boundaries are named at the level currently known;
- no unstable pronouns or inaccessible references carry essential meaning;
- no material conflict with current design or ADR remains unresolved;
- an adversarial reviewer attempted to falsify its assumptions and recorded a
  verdict;
- the work fits current capacity and does not violate the WIP decision.

Form completeness is necessary but insufficient. A syntactically complete Issue
with vague, contradictory, or unsupported content must be blocked.

## 7. Type-specific admission audit

### Bug gate

- Can another person reproduce it from the stated starting condition?
- Is the expected behavior already authoritative?
- Are version, platform, content, mods, and frequency sufficient to isolate it?
- Is the evidence appropriate to the symptom?
- Has duplicate search been performed?

If reproduction is intermittent, admission may authorize a diagnostic Issue with
a bounded evidence goal; do not misrepresent it as a confirmed fix.

### Experiment gate

- Does the Issue test one important question rather than an entire feature?
- What observation would weaken or falsify the hypothesis?
- Is the prototype smaller and cheaper than implementing the full proposal?
- Are playtest conditions fixed enough to compare results?
- Are behavioral evidence and subjective owner judgment separated?
- Are stop conditions explicit?
- Is failure accepted as a useful outcome?

Do not invent numerical success metrics when no baseline exists. The first
experiment may exist to establish the baseline.

### Implementation gate

- Does the cited design source explicitly authorize this behavior?
- Is its exact approved revision named?
- Can each acceptance item be read as precondition, action, observable result?
- Would two competent implementers make the same player-visible behavior even if
  their internal code differs?
- Are meaningful edge cases and feedback requirements present?
- Can the result be exercised in a named playable scenario or build?
- Is every plan-shaping question already resolved?

### RFC gate

- Is the decision important enough to justify durable analysis?
- Does it compare real alternatives rather than decorate a predetermined answer?
- Are assumptions identified separately from evidence?
- Does it cover reversibility, migration, compatibility, and failure modes?
- Does it say who decides and what durable artifact records acceptance?

## 8. Adversarial admission review

The reviewer must not merely summarize the draft. The review attempts to break it
by finding:

- a counterexample where acceptance passes but the intended result is absent;
- an assumption presented as fact;
- a conflicting current rule or legacy source;
- hidden expansion into another system or mechanic;
- an untestable experience claim;
- an omitted failure, save/load, timing, input, or platform condition;
- a reason the work can be locally correct but irrelevant to the playable
  milestone.

Use this comment contract:

```markdown
## Admission review

- Protocol: issue-process v0.1
- Verdict: READY | BLOCKED | REJECT
- Specification revision: rN
- Body fingerprint: <SHA-256 or equivalent stable digest>
- Milestone contribution: <one sentence>
- Strongest counterexample attempted: <scenario and result>
- Unresolved assumptions: none | <list>
- Required follow-up: none | <list>
- Reviewer: <human or agent identity>
- Owner confirmation: <identity and date>
```

`READY` requires no unresolved plan-shaping assumption. An agent review is input;
the repository owner owns the admission decision. When possible, use a reviewer
with independent evidence or an explicitly adversarial prompt rather than asking
the drafter to approve its own interpretation.

## 9. Specification revisions

- The first admitted body is `r1`.
- Its admission comment records a stable body fingerprint.
- Any edit that changes behavior, scope, evidence criteria, dependencies, risk,
  or non-goals creates `rN+1`.
- A substantive edit removes `status:ready`, `status:in-progress`, or
  `status:verify` and restores `status:triage`.
- Add a revision comment stating what changed and why. Do not rely only on the
  platform's hidden edit history.
- Typographic corrections that cannot change interpretation may keep the current
  revision, but the correction must be called out if work is in progress.
- Implementation and PR review always cite the admitted revision. Work produced
  from an older revision is stale evidence and cannot be merged unchanged.

Verification feedback has two routes:

- **Implementation failed the unchanged specification:** return to
  `status:in-progress`; do not change the specification.
- **Feedback changes desired behavior or scope:** create a new specification
  revision and return to `status:triage` before more implementation.

## 10. Results by type

### Bug

Close only after the accepted verification reproduces the old failure and proves
the corrected behavior in the relevant build, or with an explicit non-fix
resolution.

### Experiment

Close with evidence and one decision:

- accept the hypothesis and create/update durable design;
- revise it and open a new bounded experiment;
- reject it;
- inconclusive, with the exact missing evidence.

If implementation is chosen, create a separate implementation Issue referencing
the accepted experiment and current-design revision. Do not silently convert the
experiment into production work.

### Implementation

Close only after direct playable verification against the admitted revision.
Durable accepted behavior must already be represented in its canonical
current-design/ADR home; do not leave the only explanation in a closed Issue.

### RFC

Close with accepted/rejected/deferred and rationale. An accepted consequential
decision must produce or update an ADR before implementation Issues are admitted.

## 11. Automation boundary

The forms under `.github/ISSUE_TEMPLATE/` are executable mirrors of this
protocol. Required form fields enforce structure, not semantic quality.

`.github/workflows/issue-spec-guard.yml` invalidates admission when an active
Issue body is edited and applies `needs:admission-review`. It intentionally fails
closed; a harmless edit can be re-admitted cheaply, while silent specification
drift can invalidate all work.

Automation must never:

- invent missing design decisions;
- mark an Issue ready solely because fields are non-empty;
- remove a human stop/escalation decision;
- treat agent output as evidence of playable behavior.

Before enabling the forms and guard on a remote, create the labels named in
section 4 by running `scripts/bootstrap-issue-labels.sh [OWNER/REPO]`. Missing
labels are a setup failure, not permission to bypass the state model. The
third-party action used by the guard is pinned and documented in
`docs/reference/github-script.md`.

## 12. Change notes

- `0.1` — 2026-09-09: Established typed Issue contracts, clarification,
  adversarial admission, specification revision invalidation, and type-specific
  evidence rules.
