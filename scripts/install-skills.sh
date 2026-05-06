#!/usr/bin/env bash
# install-skills.sh — Install the 6-skill production baseline on the current machine.
#
# Per Nate Herk's "100+ Claude Code Skills" analysis (May 2026), these 6 skills
# are the boring-but-effective stack businesses actually pay for. Install on
# every client engagement Day 1 (or before if the machine is yours).
#
# Usage:
#   ./install-skills.sh
#
# Idempotent — safe to re-run.

set -euo pipefail

echo "→ Installing 6-skill production baseline …"
echo ""

# 1. Skill Creator — meta-skill for building other skills
echo "[1/6] Skill Creator (Anthropic official) …"
claude --no-interactive plugin install skill-creator 2>&1 || \
  echo "    (already installed or manual install required: /plugin install skill-creator)"

# 2. Superpowers — plan → test → review discipline
echo "[2/6] Superpowers …"
echo "    Manual install: see https://github.com/jasonkneen/claude-superpowers"
echo "    Once installed, available via /skill superpowers:<name>"

# 3. GSD — fresh sub-agents per task
echo "[3/6] GSD (Get Stuff Done) …"
echo "    Manual install: see https://github.com/[GSD-repo]"
echo "    Use alongside Superpowers for production builds"

# 4. Slash review — built-in 2.1.86+
echo "[4/6] Slash review (built-in) …"
echo "    No install needed if Claude Code 2.1.86+. Verify with: claude --version"

# 5. Context Mode — output compression + 3hr sessions
echo "[5/6] Context Mode …"
echo "    Manual install: see https://github.com/[context-mode-repo]"

# 6. Claude Mem — local vector-search cross-session memory
echo "[6/6] Claude Mem …"
echo "    Manual install: see https://github.com/[claude-mem-repo]"
echo "    Critical for client maintenance after consultant leaves"

echo ""
echo "Conditional add-on:"
echo "  Front-end Design — install ONLY if engagement ships client-facing UI/dashboard"
echo "    Manual install: see https://github.com/[frontend-design-repo]"
echo ""
echo "Done. Some installs require manual steps — see notes above."
echo "Next: run bootstrap.sh in the client folder to scaffold aios/"
