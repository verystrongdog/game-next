#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "usage: $0 OWNER/REPO ISSUE_NUMBER" >&2
  exit 2
fi

repo="$1"
issue_number="$2"

if [[ ! "$repo" =~ ^[^/]+/[^/]+$ ]] || [[ ! "$issue_number" =~ ^[0-9]+$ ]]; then
  echo "error: expected OWNER/REPO and a numeric ISSUE_NUMBER" >&2
  exit 2
fi

gh api "repos/${repo}/issues/${issue_number}" |
  python3 -c 'import hashlib, json, sys; body = (json.load(sys.stdin).get("body") or "").encode("utf-8"); print(hashlib.sha256(body).hexdigest())'
