#!/usr/bin/env bash
# Preview the site at http://localhost:4000 (Ctrl+C to stop).
# Runs Jekyll in Docker, so nothing needs installing on the machine except Docker.
# Extra arguments go to Jekyll, e.g.:  scripts/serve.sh --drafts
set -euo pipefail
cd "$(dirname "$0")/.."
TTY=""; [ -t 0 ] && TTY="-it"
exec docker run --rm $TTY -p 4000:4000 -p 35729:35729 \
  -u "$(id -u):$(id -g)" -e HOME=/tmp -e BUNDLE_PATH=/site/vendor/bundle \
  -v "$PWD":/site -w /site ruby:3.3 \
  bash -c 'bundle install --quiet && bundle exec jekyll serve --host 0.0.0.0 --livereload "$@"' _ "$@"
