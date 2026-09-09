# Current Playable

- Contract version: `0.1`
- Current revision: `draft-0`
- Status: not selected
- Owner: repository owner
- Source Slice Issue: none
- Target build/date: not set

## Purpose

This file names the one integrated player journey the project is trying to make
or improve now. It is a production and learning target, not the complete game
design and not the expected result of one ordinary Issue.

Until the first target is selected, only the following work may be admitted:

- a `type:slice` Issue that proposes the first playable;
- an exploratory experiment needed to choose that Slice;
- an RFC needed to unblock the choice;
- a bootstrap Task needed to create, run, or build the project safely.

Do not invent game behavior merely to fill this file. Replace the draft fields
below only after the owner admits a Slice Issue as `status:ready`.

## Current contract

- **Player promise:** not selected
- **Entry:** not selected
- **Playable loop:** not selected
- **Exit or completion:** not selected
- **Must prove in this revision:** not selected
- **Named scene/setup:** not selected
- **Allowed placeholders:** not selected
- **Accepted known defects:** none recorded
- **Cut first if capacity fails:** not selected
- **Explicit non-goals:** not selected
- **Creative judge:** repository owner by direct play
- **Linked current-design fragments:** none

## Default capacity rule

- Maintain one current playable target.
- Maintain one primary leaf production item at `status:in-progress` at a time—the
  Issue where hands-on creation or investigation is happening now.
- The current parent Slice, and a parent Implementation used only to track child
  integration, may remain open/in progress without consuming that leaf slot.
- A blocker or data-loss Bug may preempt the primary item.
- Small adjustments inside an admitted experiment envelope stay in that Issue;
  they do not create new Issues.
- Work waiting on input may be `status:blocked` and does not consume the primary
  in-progress slot.

The owner may revise this capacity explicitly in this file when measured project
needs justify it. Do not infer extra capacity from a long ready queue.

## Updating the target

An owner-admitted Slice Issue updates this file before dependent production Issues
are admitted. The update records:

1. the player journey from entry through completion;
2. the question or experience the build must prove;
3. the named scene, setup, build, and target date when known;
4. allowed placeholders and accepted known defects;
5. a cut line stating what is removed first if capacity fails;
6. the owner who will play and judge the result.

Changing the player promise, must-prove question, cut line, or acceptance basis
creates a new playable revision. A date update or clarified build locator may be
recorded without changing the revision when it cannot change scope.

## Change notes

- `0.1` — 2026-09-09: Added the canonical current playable contract and an
  explicit bootstrap state without inventing a game design.
