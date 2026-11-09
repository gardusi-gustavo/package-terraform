#!/usr/bin/env bash
set -euo pipefail
ROOT="${CI_PROJECT_DIR:-$(git rev-parse --show-toplevel)}"
cd "$ROOT"
"$ROOT/infra/scripts/ci/validate-repo.sh" --root "$ROOT"
"$ROOT/infra/scripts/ci/check-size.sh" --root "$ROOT"
"$ROOT/infra/scripts/ci/validate-local-issues.sh" --root "$ROOT"
for f in infra/scripts/*.sh; do bash -n "$f"; done
if command -v terraform >/dev/null 2>&1; then
  terraform fmt -check -recursive
  while IFS= read -r -d '' dir; do
    (cd "$dir" && terraform init -backend=false -input=false >/dev/null && terraform validate)
  done < <(find modules -type f -name '*.tf' -printf '%h\0' | sort -zu)
elif [[ "${CI:-}" == "true" || "${GITHUB_ACTIONS:-}" == "true" ]]; then
  echo "terraform is required in CI" >&2
  exit 1
else
  echo "terraform not installed; structural checks only"
fi
