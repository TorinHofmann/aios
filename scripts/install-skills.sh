#!/usr/bin/env bash
# install-skills.sh — Install the production-baseline skill stack.
#
# Idempotent — safe to re-run.

set -euo pipefail

echo "→ Installing production-baseline skills …"
echo ""

# 1. Skill Creator — meta-skill for building other skills
echo "[1/6] Skill Creator (Anthropic official) …"
claude --no-interactive plugin install skill-creator 2>&1 || \
  echo "    (already installed or manual install required: /plugin install skill-creator)"

# 2. Superpowers — plan → test → review discipline
echo "[2/6] Superpowers …"
echo "    Manual install: see https://github.com/jasonkneen/claude-superpowers"

# 3. GSD — fresh sub-agents per task
echo "[3/6] GSD (Get Stuff Done) …"
echo "    Manual install: see https://github.com/[GSD-repo]"

# 4. Slash review — built-in 2.1.86+
echo "[4/6] Slash review (built-in) …"
echo "    Built into Claude Code 2.1.86+. Verify with: claude --version"

# 5. Context Mode — output compression
echo "[5/6] Context Mode …"
echo "    Manual install: see https://github.com/[context-mode-repo]"

# 6. Claude Mem — cross-session memory
echo "[6/6] Claude Mem …"
echo "    Manual install: see https://github.com/[claude-mem-repo]"

echo ""
echo "Conditional add-on:"
echo "  Front-end Design — install only if shipping UI"
echo ""
echo "Done."
