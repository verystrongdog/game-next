# Repository Agent Instructions

## Required context

- Read `WORKFLOW.md` before any repository task.
- For Issue intake, creation, editing, triage, planning, or implementation, also
  read `docs/workflow/issues.md` completely.

## Issue gate

- Do not implement production behavior from raw chat, a Discussion, a legacy
  document, or an Issue that is not `status:ready`.
- Repository bootstrap and owner-authorized workflow maintenance are exceptions;
  they may change governance files without a ready implementation Issue.
- An experiment Issue authorizes only the stated prototype and evidence
  collection. It does not authorize silently promoting the prototype into
  production design.
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

## Scope

- Do not touch unrelated files or revert user changes.
- If a task exposes a missing recurring rule, finish or block the task according
  to current policy, then propose a separate workflow revision.

