# Issue Process

- Protocol version: `0.2`
- Parent authority: [`WORKFLOW.md`](../../WORKFLOW.md)
- Current production target: [`PLAYABLE.md`](../../PLAYABLE.md)
- Status: active
- Last revised: 2026-09-09

## 1. Purpose

An Issue is a bounded production, investigation, defect, or decision contract. It
is not an idea dump, the complete game design, proof that work is valuable, or a
substitute for playing an integrated build.

The process must preserve uncertainty without turning every small production task
into a full design review. Admission cost follows delivery risk.

## 2. Artifact boundaries

| Artifact | Role | Authority |
| --- | --- | --- |
| Discussion/chat/raw note | Capture observations, ideas, and disagreement | Evidence only |
| Legacy document | Historical evidence and candidate reasoning | Never current by default |
| `PLAYABLE.md` | One current integrated player journey, cut line, and production priority | Current production scope |
| Slice Issue | Propose, revise, integrate, and judge one playable target | Authoritative only at its admitted revision |
| Other Issue | One local work or investigation contract | Authoritative only at its admitted revision |
| Current-design fragment | Current accepted player/game behavior | Durable design authority |
| ADR | Accepted consequential technical/design decision | Durable decision authority |
| Build/test/playtest | Executable and observational evidence | Evidence, not design authority |

Link canonical facts rather than copying them. A Slice owns the integrated target;
its child Issues own only their local deliverables.

## 3. Issue types

Every Issue uses exactly one type.

### 3.1 Playable Slice — `type:slice`

Use to propose the first current playable, revise it materially, or integrate and
judge its result. A Slice describes:

- a short player journey with entry, loop, and exit;
- the experience or production question the build must prove;
- a named scene/setup and target build or date when known;
- allowed placeholders and accepted known defects;
- `must prove`, explicit non-goals, and `cut first`;
- the final creative judge and required evidence.

An owner-admitted Slice updates `PLAYABLE.md` before dependent production Issues
are admitted. It is not a container for every detailed implementation decision.

### 3.2 Bug — `type:bug`

Use when observed behavior contradicts an accepted expectation. Record the
smallest reproduction evidence justified by player impact:

- **Blocker:** the current playable cannot start or continue.
- **Data loss:** save, progress, configuration, or authored content can be lost or
  corrupted.
- **Major:** a core experience is broken without a reasonable workaround.
- **Normal:** behavior is degraded but contained or has a workaround.
- **Cosmetic:** presentation or text is wrong without changing play.

Blocker and data-loss Bugs are `strict`; they may preempt current work so the owner
can stop distribution or apply a bounded mitigation before completing diagnosis.
Major Bugs are at least `standard`. Normal and cosmetic Bugs may use `fast`
admission when local and reversible; the owner may escalate any Bug.

Before full Strict admission, an explicit owner comment may authorize only
containment: stop distribution, preserve or back up data, disable the failing path,
or add diagnostics. It does not authorize an unreviewed permanent fix.

A disagreement about desired behavior is an Experiment or RFC, not automatically
a Bug.

### 3.3 Design or technical Experiment — `type:experiment`

Use when important uncertainty must be reduced through a paper prototype, graybox,
playable prototype, technical spike, measurement, or playtest.

Choose a mode:

- **Exploratory:** there is not yet a defensible baseline or falsifiable mechanic.
  Be strict about the question, experience intent, timebox, smallest artifact,
  and stopping condition. State honestly that evidence is not yet available.
- **Comparative:** alternatives or a baseline exist. Be strict about the
  hypothesis, comparison conditions, evidence, and interpretation.

Every admitted Experiment defines an iteration envelope:

- parameters, content, or variants allowed to change;
- rules and experience constraints that must not change;
- maximum time or iteration count;
- a fixed enough playable scenario for comparison;
- evidence recorded for each named build.

Changes inside the envelope are logged in comments and do not require a new Issue
revision. Going outside it returns the Issue to triage.

An Experiment does not authorize production adoption. Its result may be accepted,
revised, rejected, or inconclusive.

### 3.4 Design Implementation — `type:implementation`

Use for an integrated player-visible behavior whose intended design is already
accepted. It names:

- the current playable and accepted design revision;
- player-visible behavior and meaningful boundaries;
- behavioral acceptance examples;
- presentation needed for player comprehension;
- target scene/build and integration evidence;
- dependencies, child Tasks, placeholders, and non-goals.

If a plan-shaping design question remains, use or reopen an Experiment/RFC. Do not
let the implementer decide silently.

### 3.5 Production Task — `type:task`

Use for a bounded delivery that supports a Slice or Implementation without owning
a new player-experience decision. Workstreams include:

- code and integration;
- graybox, level, content, and data;
- art, animation, VFX, audio, UI, and narrative;
- build, tooling, import pipeline, tests, and technical debt.

A Task records its deliverable, integration point, inputs/dependencies, verification,
and any remaining placeholder or debt. If it discovers a design or architecture
decision, block it and open the appropriate Experiment or RFC.

Do not create a child Task for a tiny adjustment already inside an admitted parent
scope or Experiment envelope; record it with its parent evidence.

### 3.6 RFC / Decision — `type:rfc`

Use for consequential or difficult-to-reverse decisions such as system ownership,
save compatibility, data formats, cross-system contracts, major control/camera
models, or workflow governance.

An RFC is always `strict`. It compares credible options, consequences, migration,
rollback, and failure modes. It authorizes analysis and explicitly bounded
prototypes, not production implementation, until accepted into an ADR or current
design fragment.

## 4. Delivery-risk lanes

The author proposes a lane. The owner or reviewer may escalate it. Never lower a
lane merely to bypass missing evidence.

### Fast

For local, low-impact, easy-to-reverse work that does not alter accepted game
behavior, saves/data formats, cross-system contracts, the core playable promise,
or release safety.

Admission requires:

- a concrete deliverable or defect;
- the current playable contribution or a legitimate maintenance/bootstrap reason;
- a direct verification step;
- a bounded scope and simple rollback;
- explicit owner confirmation of the body revision.

Independent adversarial review and a body fingerprint are optional.

### Standard

For normal feature, content, integration, or Experiment work. Add:

- source evidence or accepted design;
- dependencies and at least one meaningful non-goal;
- the strongest plausible counterexample or integration failure;
- a specification revision and stable body fingerprint.

### Strict

For core player promises, save/data loss, hard-to-reverse architecture, broad
cross-system changes, platform/release risk, or costly production commitments.
Add:

- explicit alternatives and unresolved assumptions;
- failure containment, rollback, and migration where relevant;
- affected boundaries and regression scope;
- a full adversarial admission review and stable body fingerprint.

Risk sizing controls review cost, not quality. A Fast Issue still needs an
observable result; a Strict Issue still cannot prove that an experience is fun
without play.

## 5. Lifecycle and labels

Type and status are independent. Every open Issue has exactly one `type:*` and
one `status:*` label.

Type labels:

- `type:slice`
- `type:bug`
- `type:experiment`
- `type:implementation`
- `type:task`
- `type:rfc`

Status labels:

- `status:triage` — draft exists but is not authorized for work;
- `status:blocked` — admission or production is waiting on evidence or a decision;
- `status:ready` — one body revision is admitted at its declared risk lane;
- `status:in-progress` — admitted work has started;
- `status:verify` — a claimed result awaits integration/play evidence.

Optional reason labels may coexist:

- `needs:clarification`
- `needs:evidence`
- `needs:decision`
- `needs:admission-review`

Closed state records accepted, duplicate, rejected, obsolete, cut, mitigated, or
inconclusive. Do not add a redundant `status:done`.

```text
form draft -> triage -> ready -> in-progress -> verify -> close
                 |         |          |            |
                 +-> blocked <---------+------------+
                 |                                 |
                 +-> reject/cut/duplicate -> close +-> revise -> triage
```

## 6. Clarification

The clarifier helps the owner express a decision; it does not invent one.

1. Preserve the raw source, build, attachment, or exact observation.
2. Select the Issue type and proposed risk lane before demanding detail.
3. Ask at most two or three plan-shaping questions per round.
4. Separate experience intent, observed behavior, subjective judgment, production
   deliverable, and implementation detail.
5. Offer alternatives and trade-offs when known, but do not choose for the owner.
6. Do not fill required meaning with invented assumptions, `N/A`, arbitrary
   metrics, or “as appropriate.” An explicit unknown is valid in an Experiment.
7. Render the complete draft and obtain owner confirmation.

References such as “that red box” or “same as before” require a stable textual
locator. Media remains evidence; text states which part matters.

## 7. Admission

All admitted Issues must:

- be open with exactly one type and one status label;
- identify the current playable contribution, or state the allowed first-Slice,
  bootstrap, maintenance, or future-constraint exception;
- have the correct type and risk lane;
- define an observable deliverable, evidence result, or bounded decision;
- name dependencies and boundaries at the level justified by the lane;
- have no unresolved conflict with current design or ADR;
- fit the capacity recorded in `PLAYABLE.md`;
- have explicit owner confirmation of the complete body revision.

Then apply the lane-specific requirements in section 4 and the type gate below.
Form completeness never proves semantic quality.

### Type gates

**Slice**

- Can a player journey be followed from entry to exit?
- Is `must prove` smaller than “make the game fun”?
- Are placeholders, known defects, non-goals, and `cut first` explicit?
- Is there a named human creative judge who will play the result?

**Bug**

- Does severity match player impact rather than reporter frustration?
- Is expected behavior already authoritative?
- Are build, starting condition, frequency, workaround, and evidence sufficient for
  the severity?
- For data loss, are affected versions, recovery, containment, and regression
  scope recorded?

**Experiment**

- Is the mode honestly exploratory or comparative?
- Does it test one important uncertainty using the cheapest useful medium?
- Is the iteration envelope bounded?
- Are observations separated from player statements and owner judgment?
- Are stop conditions and prototype disposition explicit?

**Implementation**

- Does accepted design authorize the behavior at the named revision?
- Can acceptance be read as precondition, action, and observable result?
- Is there an integrated playable scenario, not only component completion?
- Are all plan-shaping questions resolved?

**Task**

- Is the deliverable independently useful, blocking, or large enough to track?
- Does it name its parent Slice/Implementation or legitimate maintenance reason?
- Does it avoid silently deciding new game behavior?
- Are integration input, output, and remaining placeholders/debt visible?

**RFC**

- Is the decision important enough for Strict review?
- Are real alternatives, reversibility, consequences, and decision owner present?
- Does acceptance produce an ADR or current-design fragment?

## 8. Admission record

Use this comment for Standard and Strict Issues. Fast Issues may use the short form
below.

```markdown
## Admission review

- Protocol: issue-process v0.2
- Verdict: READY | BLOCKED | REJECT
- Risk: STANDARD | STRICT
- Specification revision: rN
- Body fingerprint: <SHA-256 or equivalent stable digest>
- Playable contribution or allowed exception: <one sentence>
- Strongest counterexample attempted: <scenario and result>
- Unresolved assumptions: none | <list>
- Failure containment/rollback: <required for Strict when applicable>
- Required follow-up: none | <list>
- Reviewer: <human or agent identity>
- Owner confirmation: <identity and date>
```

Fast form:

```markdown
## Fast admission

- Protocol: issue-process v0.2
- Verdict: READY | BLOCKED
- Specification revision: rN
- Why Fast is safe: <local, reversible, no protected boundary>
- Direct verification and rollback: <steps>
- Owner confirmation: <identity and date>
```

An agent review is evidence. The repository owner owns the decision. Standard and
Strict review must attempt to break the draft, not merely summarize it.

## 9. Revisions and iteration

- The first admitted body is `r1`.
- Standard and Strict admission records a stable body fingerprint; Fast may omit
  it but remains bound to the confirmed body.
- Generate the fingerprint from the body returned by GitHub with
  `scripts/issue-body-sha256.sh OWNER/REPO ISSUE_NUMBER`; this defines the UTF-8
  hashing method without relying on copied text or platform edit rendering.
- Editing behavior, scope, evidence criteria, dependencies, risk, iteration
  envelope, or non-goals creates `rN+1` and returns the Issue to triage.
- Typographic corrections that cannot change interpretation may keep the revision;
  call them out when work is active.
- Changes explicitly inside an admitted Experiment envelope do not edit the body.
  Record a comment containing build/commit, parameters or variant, observed player
  behavior, player feedback summary, owner judgment, confidence, and next step.
- Work produced from an older invalidated revision is stale until rechecked.

Verification has two routes:

- implementation failed the unchanged contract: return to `in-progress`;
- desired behavior, scope, or experiment envelope changed: revise and return to
  `triage` before continuing outside the admitted boundary.

## 10. Verification and closure

Every Issue reaching `status:verify` records the applicable fields:

```markdown
## Delivery evidence

- Integrated: yes | no | not applicable
- Playable in: <build/commit and exact scene/setup>
- Playtested: yes | no | not applicable
- Creative owner accepted: yes | no | not applicable
- Automated/manual checks: <links or commands and results>
- Placeholders and debt remaining: none | <list>
- Result: accept | iterate | cut | mitigate | reject | inconclusive
```

These fields are evidence dimensions, not extra status labels. “Code complete” or
“asset exported” is not the same as integrated, playable, or accepted.

### Slice

Close only after the named journey is played in the target build and the owner
records what it proved, what was cut, and which placeholders/debts remain. Update
`PLAYABLE.md` when accepting, revising, completing, or replacing the target.

### Bug

Close after the old failure and corrected behavior are checked at the admitted
risk level, or with an explicit non-fix/mitigation resolution. Data-loss Bugs
include recovery and regression results.

### Experiment

Close as accept, revise, reject, or inconclusive with evidence. Also record one
prototype disposition:

- delete it;
- isolate it in a test scene, branch, or feature flag;
- reuse only named parts;
- rewrite named parts before production;
- accept explicitly listed prototype debt.

Accepted behavior is promoted to a current-design fragment. Production delivery
uses a separate Implementation or Task; do not silently relabel the prototype.

### Implementation

Close after integrated playable verification against the admitted revision and
owner judgment where experience is involved. Durable behavior must already live
in its current-design/ADR home.

### Task

Close when its deliverable is integrated or consumed by its parent and verification
passes. Record remaining placeholders, technical debt, content debt, or verification
debt rather than hiding them behind closure.

### RFC

Close as accepted, rejected, or deferred with rationale. Acceptance must update an
ADR or current-design fragment before dependent production work is admitted.

## 11. Promoting legacy design

Legacy material is evidence, never current wholesale. Promote only the fragment
needed by the current Slice using [`docs/design/README.md`](../design/README.md).

The promoting Issue records the exact source locator, accepted meaning, rejected
or unknown remainder, examples/rules sufficient for the next work, validation
scene, and owner decision. The resulting committed fragment becomes authority;
the rest of the legacy source does not.

## 12. Automation boundary

Issue Forms mirror structure, not judgment. The specification guard invalidates
an admitted Issue when its body changes. It does not prove that `status:ready` was
legitimately applied, assess delivery risk, or determine whether a game experience
is acceptable.

Automation must never:

- invent design decisions or evidence;
- mark an Issue ready because fields are non-empty;
- interpret player enjoyment as an automated pass/fail result;
- remove a human stop or escalation decision;
- treat an agent report as proof of playable behavior.

Create or update labels with `scripts/bootstrap-issue-labels.sh [OWNER/REPO]`.
The official Action version and behavior are documented in
`docs/reference/github-script.md`.

## 13. Change notes

- `0.1` — 2026-09-09: Established typed contracts, clarification, adversarial
  admission, revision invalidation, and type-specific evidence rules.
- `0.2` — 2026-09-09: Added Playable Slice and Production Task, risk-sized
  admission, exploratory experiments, iteration envelopes, integrated delivery
  evidence, prototype disposition, and legacy fragment promotion.
