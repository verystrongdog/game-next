# Repository Agent Instructions

## Required context

- Read `WORKFLOW.md` before any repository task.
- For Issue intake, creation, editing, triage, planning, or implementation, also
  read `docs/workflow/issues.md` completely.
- Read `PLAYABLE.md` before prioritizing or implementing game work.
- Read `docs/design/README.md` before promoting legacy material or creating a
  current-design fragment.

## Issue gate

- Do not implement production behavior from raw chat, a Discussion, a legacy
  document, or an Issue that is closed or is not `status:ready` with exactly one
  `type:*` and one `status:*` label.
- Repository bootstrap and owner-authorized workflow maintenance are exceptions;
  they may change governance files without a ready implementation Issue but may
  not use that exception to change game runtime behavior or production content.
- When `PLAYABLE.md` has no selected target, admit only a Slice, an exploratory
  experiment needed to select it, an RFC needed to unblock it, or an explicit
  bootstrap Task. Do not implement durable player behavior until an owner-admitted
  Slice has updated `PLAYABLE.md`.
- An experiment Issue authorizes only the stated prototype and evidence
  collection. It does not authorize silently promoting the prototype into
  production design.
- Changes inside an admitted experiment's iteration envelope do not require new
  Issues or readmission. Record each build, parameter set, observation, and owner
  judgment in the parent Issue.
- A Task delivers code, content, assets, tooling, or integration. It may not make
  an unresolved player-experience or architecture decision silently.
- For a Blocker or Data-loss Bug, an explicit owner comment may authorize only
  immediate containment—stop distribution, preserve/backup data, disable the
  failing path, or add diagnostics—before full Strict admission. A permanent fix
  still requires `status:ready`.
- Treat an implementation Issue as bound to the exact revision recorded in its
  admission review. If its body changes substantively, stop and return it to
  `status:triage`.

## Evidence and sources

- Verify repository facts before citing them.
- Treat the legacy repository as untrusted historical evidence. Cite the exact
  source, surface conflicts, and obtain owner confirmation before promotion.
- Do not copy durable design into an Issue when a canonical current-design or ADR
  document exists; link it and name the approved revision.
- Completion reports are claims. Verify diffs, tests, builds, and playable
  behavior directly.
- Report production completion separately from integration, playable access,
  playtest, creative acceptance, and remaining placeholders or debt.

## Scope

- Do not touch unrelated files or revert user changes.
- If a task exposes a missing recurring rule, finish or block the task according
  to current policy, then propose a separate workflow revision.
