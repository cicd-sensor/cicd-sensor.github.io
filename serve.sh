#!/bin/sh
# Live-edit the cicd-sensor documentation locally with this repo's theme.
#
# Clone cicd-sensor/cicd-sensor as a sibling directory so that
# ../cicd-sensor/docs/ exists, then run this script. Override SRC to
# point elsewhere if your layout differs.
#
# Requires mdbook and mdbook-mermaid on PATH (cargo install mdbook-mermaid).
#
# On macOS, if file changes are not picked up reliably, add `--watcher poll`
# to the mdbook serve command below.

set -e

SRC=${SRC:-../cicd-sensor/docs}

if [ ! -d "$SRC" ]; then
  echo "error: docs source not found at $SRC" >&2
  echo "  Clone cicd-sensor/cicd-sensor as a sibling, or set SRC=path/to/docs" >&2
  exit 1
fi

MDBOOK_BOOK__SRC="$SRC" mdbook serve --open --hostname 127.0.0.1 --port 3000
