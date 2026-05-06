# Based On

The contents of `scaffold/` are derived from Nate Herk's MIT-licensed AIS-OS scaffold, the companion repo to his "Build & Sell Claude Code Operating Systems" course (YouTube ID `bCljOfCH8Ms`).

- **Upstream:** https://github.com/nateherk/aios (or wherever Nate's repo lives — last verified May 2026)
- **Snapshot commit:** `b6b7a05`
- **Snapshot date:** 2026-05-02
- **License:** MIT (preserved verbatim in `LICENSE-NATE`)

## What we changed
- Removed Nate's `LICENSE` and `README.md` from `scaffold/` (preserved at repo root as `LICENSE-NATE` and folded into our own README)
- Added our own playbooks, integrations, prompts, and bootstrap script outside `scaffold/`
- Customized `CLAUDE.md` and `connections.md` templates over time as engagement learnings compound

## How we update upstream
- `.git` is intentionally stripped from the vendored copy — no auto-pulls.
- Before pulling any upstream change, diff against the current `scaffold/` and decide which deltas to take. Nate's scaffold may evolve in ways that don't match our engagement model.
- When we do bump, update the snapshot commit + date in this file.

## Trademark note
"The Three Ms of AI™" is Nate Herk's trademark. The framework content is MIT-licensed and we may use and redistribute it; the trademark on the name itself is reserved to Nate.
