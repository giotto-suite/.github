#!/usr/bin/env bash
# Rebuilds module release sites whose default branch moved since their last
# release build. Run by .github/workflows/rebuild-release-sites.yaml.
#
# A module's release site documents its default branch (main is production),
# but main carries no CI, so nothing there can trigger the rebuild. This
# checks from outside instead.
#
# A module is in scope when its `website` branch has the template's
# pkgdown.yaml, recognised by its `release-ref` input. "Last release build" is
# the newest successful run whose release job succeeded: dev-only runs, from
# the dev triggers, are more frequent and must not count.
#
# env: ORG, DRY_RUN (true|false), GH_TOKEN
set -euo pipefail
ORG="${ORG:-giotto-suite}"
DRY_RUN="${DRY_RUN:-false}"

last_release_build() {  # repo -> ISO time of the newest successful release build, or ""
  local repo=$1 id
  for id in $(gh api "repos/$ORG/$repo/actions/workflows/pkgdown.yaml/runs?branch=website&status=success&per_page=20" \
      -q '.workflow_runs[].id' 2>/dev/null); do
    if gh api "repos/$ORG/$repo/actions/runs/$id/jobs" \
        -q '.jobs[] | select(.name | startswith("release /")) | select(.conclusion == "success") | .name' \
        | grep -q .; then
      gh api "repos/$ORG/$repo/actions/runs/$id" -q .created_at
      return
    fi
  done
}

for repo in $(gh repo list "$ORG" --no-archived -L 200 --json name -q '.[].name'); do
  wf=$(gh api "repos/$ORG/$repo/contents/.github/workflows/pkgdown.yaml?ref=website" \
         -q .content 2>/dev/null | base64 -d 2>/dev/null) || continue
  grep -q 'release-ref:' <<<"$wf" || continue

  branch=$(gh api "repos/$ORG/$repo" -q .default_branch)
  head=$(gh api "repos/$ORG/$repo/commits/$branch" -q .commit.committer.date)
  built=$(last_release_build "$repo")

  # ISO 8601 UTC timestamps compare correctly as strings
  if [[ -n "$built" && ! "$head" > "$built" ]]; then
    echo "$repo: up to date ($branch at $head, built $built)"
    continue
  fi
  echo "$repo: rebuild ($branch at $head, last release build ${built:-never})"
  if [[ "$DRY_RUN" != "true" ]]; then
    gh workflow run pkgdown.yaml -R "$ORG/$repo" --ref website -f site=release
  fi
done
