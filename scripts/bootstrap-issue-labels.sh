#!/usr/bin/env bash
set -euo pipefail

repo_args=()
if [[ $# -gt 1 ]]; then
  echo "usage: $0 [OWNER/REPO]" >&2
  exit 2
fi
if [[ $# -eq 1 ]]; then
  repo_args=(--repo "$1")
fi

create_label() {
  local name="$1"
  local color="$2"
  local description="$3"
  gh label create "$name" "${repo_args[@]}" \
    --color "$color" --description "$description" --force
}

create_label "type:bug" "d73a4a" "Observed behavior contradicts an accepted expectation"
create_label "type:experiment" "8250df" "Bounded game-design hypothesis test"
create_label "type:implementation" "1d76db" "Implementation of already accepted design"
create_label "type:rfc" "0e8a16" "Consequential decision requiring durable review"

create_label "status:triage" "fbca04" "Draft exists; work is not authorized"
create_label "status:blocked" "b60205" "Admission is blocked pending resolution"
create_label "status:ready" "0e8a16" "Exact specification revision is admitted"
create_label "status:in-progress" "1d76db" "Admitted work is in progress"
create_label "status:verify" "5319e7" "Claimed result awaits direct verification"

create_label "needs:clarification" "d4c5f9" "Issue meaning or scope needs clarification"
create_label "needs:evidence" "c5def5" "Issue needs reproduction or design evidence"
create_label "needs:decision" "f9d0c4" "Repository owner decision is required"
create_label "needs:admission-review" "e4e669" "Specification revision needs a new admission review"
