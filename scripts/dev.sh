#!/bin/sh
# Live-edit the cicd-sensor documentation locally with this repo's theme.
#
# Clone cicd-sensor/cicd-sensor as a sibling directory so that
# ../cicd-sensor/docs/src/ exists, then run this script. Override SRC to
# point elsewhere if your layout differs.
#
# On macOS, if file changes are not picked up reliably, add `--watcher poll`
# to the mdbook serve command below.

set -e

SRC=${SRC:-../cicd-sensor/docs/src}

if [ ! -d "$SRC" ]; then
  echo "error: docs source not found at $SRC" >&2
  echo "  Clone cicd-sensor/cicd-sensor as a sibling, or set SRC=path/to/docs/src" >&2
  exit 1
fi

MDBOOK_BOOK__SRC="$SRC" mdbook serve --open --hostname 127.0.0.1 --port 3000
