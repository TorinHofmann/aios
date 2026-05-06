#!/usr/bin/env bash
# install-skills.sh — Install the production-baseline skill stack.
#
# Idempotent — safe to re-run. Marketplace plugins install via `claude plugin install`;
# non-marketplace skills require manual install with the URL noted.

set -euo pipefail

echo "→ Installing production-baseline skills …"
echo ""

# 1. Skill Creator — meta-skill for building other skills (Anthropic official)
echo "[1/7] Skill Creator …"
claude plugin install skill-creator@claude-plugins-official 2>&1 || \
  echo "    (already installed or run manually: /plugin install skill-creator@claude-plugins-official)"

# 2. Superpowers — plan → test → review discipline (Anthropic official)
echo "[2/7] Superpowers …"
claude plugin install superpowers@claude-plugins-official 2>&1 || \
  echo "    (already installed or run manually: /plugin install superpowers@claude-plugins-official)"

# 3. Code Review — /review slash command (Anthropic official)
echo "[3/7] Code Review …"
claude plugin install code-review@claude-plugins-official 2>&1 || \
  echo "    (already installed or run manually: /plugin install code-review@claude-plugins-official)"

# 4. Context7 — up-to-date library docs lookup (Anthropic official)
echo "[4/7] Context7 …"
claude plugin install context7@claude-plugins-official 2>&1 || \
  echo "    (already installed or run manually: /plugin install context7@claude-plugins-official)"

# 5. GSD — fresh sub-agents per task (manual install)
echo "[5/7] GSD (Get Stuff Done) …"
echo "    Manual install — confirm latest install path before running."

# 6. Context Mode — output compression / longer sessions (manual install)
echo "[6/7] Context Mode …"
echo "    Manual install — confirm latest install path before running."

# 7. Claude Mem — local cross-session memory (manual install)
echo "[7/7] Claude Mem …"
echo "    Manual install — confirm latest install path before running."

echo ""
echo "Conditional add-on:"
echo "  Front-end Design — install only if the company will ship UI"
echo ""
echo "Done. Verify installs with:  claude plugin list"
