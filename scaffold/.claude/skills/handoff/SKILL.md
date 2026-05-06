---
name: handoff
description: Write or update SESSION_HANDOFF.md so the next session with fresh context can continue this work. Use at session end, before risky operations, or when the user says "handoff", "checkpoint", or "save state".
---

Write or update `SESSION_HANDOFF.md` at the project root so the next Claude session can resume seamlessly with zero context loss.

## When to run this skill

- **End of every working session** — proactively, before the user signals done
- **Before any risky operation** — major refactors, destructive git commands, dependency upgrades, deploys
- **Mid-session when context shifts** — a decision lands, a file is touched substantively, a blocker appears
- **When the user says** "handoff", "checkpoint", "save state", or signals end-of-session

## Steps

1. Read existing `SESSION_HANDOFF.md` first to understand prior state.
2. **Overwrite, don't append.** It's a living snapshot, not a log. Historical context belongs in `decisions/log.md` or `archives/`.
3. Update these sections (in this order):
   - **Last Updated** — ISO timestamp
   - **Current Objective** — what we're building and why (1-3 sentences)
   - **Status Right Now** — working ✅ / in-progress 🔧 / broken ⚠️ / untested 🧪
   - **Files Touched This Session** — full paths + one-line change descriptions
   - **Key Decisions** — what got decided, with reasoning. Append a one-liner here AND a full entry in `decisions/log.md`.
   - **Context Not in Code** — verbal constraints, third-party quirks, gotchas the code doesn't show
   - **Open Questions** — flagged items, unfixed bugs, deferred decisions
   - **Exact Next Steps** — literal next 3-5 actions in order
   - **Commands & Environment** — non-obvious commands, env vars, running processes
   - **Do NOT** — dead ends, things to avoid retrying, traps the previous session hit
4. Err on the side of too much detail. A fresh Claude with zero context should resume seamlessly.
5. Tell the user "Handoff updated." in one line. Don't dump the whole file.
