#!/usr/bin/env bash
# bootstrap.sh — Set up an aios/ scaffold in a target working directory.
#
# Usage from inside a target folder:
#   git clone https://github.com/torinhofmann/aios.git aios-tmp && \
#     ./aios-tmp/bootstrap.sh && rm -rf aios-tmp
#
# Or from the aios repo root, pointing at a target folder:
#   ./bootstrap.sh /path/to/target

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-$(pwd)}"

if [[ "$TARGET_DIR" == "$REPO_ROOT" ]]; then
  echo "✗ Refusing to bootstrap inside the aios repo itself."
  echo "  Run from a target folder, or pass a target path: ./bootstrap.sh /path/to/target"
  exit 1
fi

if [[ ! -d "$TARGET_DIR" ]]; then
  echo "✗ Target dir does not exist: $TARGET_DIR"
  exit 1
fi

OUT="$TARGET_DIR/aios"

if [[ -d "$OUT" ]]; then
  echo "✗ $OUT already exists. Refusing to overwrite."
  echo "  Rename or remove the existing aios/ first."
  exit 1
fi

echo "→ Bootstrapping aios/ in $TARGET_DIR …"
cp -R "$REPO_ROOT/scaffold/" "$OUT/"
echo "  ✓ scaffold copied"

echo ""
echo "Next:"
echo "  1. cd $OUT"
echo "  2. Customize CLAUDE.md, connections.md, aios-intake.md"
echo "  3. Install production-baseline skills:  $REPO_ROOT/scripts/install-skills.sh"
echo ""
echo "Done."
