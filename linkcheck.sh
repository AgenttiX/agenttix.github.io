#!/usr/bin/env bash
# Check that the external links on the website are still valid.
# This is the local equivalent of ./.github/workflows/linkcheck.yml
# and works similarly to the linkcheck feature of Sphinx.
#
# Uses the lychee link checker: https://github.com/lycheeverse/lychee
# If lychee is not installed, it's run in a Docker container instead.
#
# Usage:
#   ./linkcheck.sh                 # check all pages
#   ./linkcheck.sh it/vpn.md       # check only the given files
#   ./linkcheck.sh --cache=false   # any lychee arguments can be passed
#
# The settings are in ./lychee.toml and the ignored URLs in ./.lycheeignore
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

# Match the version used by the GitHub Actions workflow
LYCHEE_VERSION="0.24.2"

# Files to check unless given as arguments
DEFAULT_TARGETS=('./**/*.md' './**/*.html')

# Split the given arguments into options and file targets
OPTS=()
TARGETS=()
for arg in "$@"; do
  if [[ "$arg" == -* ]]; then
    OPTS+=("$arg")
  else
    TARGETS+=("$arg")
  fi
done
if [[ ${#TARGETS[@]} -eq 0 ]]; then
  TARGETS=("${DEFAULT_TARGETS[@]}")
fi

if command -v lychee > /dev/null; then
  exec lychee ${OPTS[@]+"${OPTS[@]}"} -- "${TARGETS[@]}"
elif command -v docker > /dev/null; then
  # The repository is mounted read-write so that the cache file .lycheecache can be updated.
  # The container is run as the current user so that the cache file is not owned by root.
  # The host network is used, as Docker's default bridge network has no IPv6 connectivity,
  # which results in "Network unreachable" errors for sites that resolve to IPv6 first.
  DOCKER_OPTS=()
  if [[ -t 0 && -t 1 ]]; then
    DOCKER_OPTS+=(--interactive --tty)
  fi
  exec docker run --rm ${DOCKER_OPTS[@]+"${DOCKER_OPTS[@]}"} \
    --network host \
    --user "$(id -u):$(id -g)" \
    --volume "$PWD:/input" \
    --workdir /input \
    --env GITHUB_TOKEN="${GITHUB_TOKEN:-}" \
    "lycheeverse/lychee:${LYCHEE_VERSION}" ${OPTS[@]+"${OPTS[@]}"} -- "${TARGETS[@]}"
else
  echo "Error: neither lychee nor docker was found." >&2
  echo "Install lychee (https://github.com/lycheeverse/lychee#installation) or Docker." >&2
  exit 1
fi
