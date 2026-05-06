#!/usr/bin/env bash
# bootstrap.sh — Set up an aios/ working dir for a new client engagement.
#
# Usage from inside a client folder:
#   git clone https://github.com/torinhofmann/aios.git aios-tmp && \
#     ./aios-tmp/bootstrap.sh && rm -rf aios-tmp
#
# Or from the aios repo root, pointing at a client folder:
#   ./bootstrap.sh /path/to/client/folder

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-$(pwd)}"

if [[ "$TARGET_DIR" == "$REPO_ROOT" ]]; then
  echo "✗ Refusing to bootstrap inside the aios repo itself."
  echo "  Run from a client folder, or pass a target path: ./bootstrap.sh /path/to/client"
  exit 1
fi

if [[ ! -d "$TARGET_DIR" ]]; then
  echo "✗ Target dir does not exist: $TARGET_DIR"
  exit 1
fi

CLIENT_AIOS="$TARGET_DIR/aios"

if [[ -d "$CLIENT_AIOS" ]]; then
  echo "✗ $CLIENT_AIOS already exists. Refusing to overwrite."
  echo "  If you want to re-bootstrap, rename or remove the existing aios/ first."
  exit 1
fi

echo "→ Bootstrapping aios/ in $TARGET_DIR …"
cp -R "$REPO_ROOT/scaffold/" "$CLIENT_AIOS/"
echo "  ✓ scaffold copied"

cp "$REPO_ROOT/integrations/hubspot.md" "$CLIENT_AIOS/integrations-hubspot.md" 2>/dev/null || true
cp "$REPO_ROOT/integrations/google-workspace.md" "$CLIENT_AIOS/integrations-gws.md" 2>/dev/null || true
cp "$REPO_ROOT/integrations/slack.md" "$CLIENT_AIOS/integrations-slack.md" 2>/dev/null || true
echo "  ✓ integration starters copied"

cat > "$CLIENT_AIOS/.engagement.md" <<'EOF'
# Engagement Snapshot

Fill these in Day 1.

- **Client:** _________
- **Owner:** _________
- **Tech lead:** _________
- **Stack:** _________ (CRM / GWS / Slack / other)
- **Engagement archetype:** [ ] backend-first  [ ] operator-first
- **Week 1 picks (locked Friday EOD):**
  1. _________
  2. _________
- **Off-ramp date:** end of week N
EOF
echo "  ✓ .engagement.md stub created"

echo ""
echo "Next steps:"
echo "  1. cd $CLIENT_AIOS"
echo "  2. Customize CLAUDE.md with client business context"
echo "  3. Customize connections.md with their actual stack"
echo "  4. Run /onboard skill with client owner Day 1 morning"
echo "  5. Install production-tooling skills:  $REPO_ROOT/scripts/install-skills.sh"
echo ""
echo "Done."
