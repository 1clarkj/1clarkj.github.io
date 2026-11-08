#!/usr/bin/env bash
# Build the site into _site/ exactly as GitHub Actions will. Extra arguments go to Jekyll.
set -euo pipefail
cd "$(dirname "$0")/.."
exec docker run --rm \
  -u "$(id -u):$(id -g)" -e HOME=/tmp -e BUNDLE_PATH=/site/vendor/bundle -e JEKYLL_ENV=production \
  -v "$PWD":/site -w /site ruby:3.3 \
  bash -c 'bundle install --quiet && bundle exec jekyll build "$@"' _ "$@"
