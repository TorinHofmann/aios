# Attribution

## scaffold/

The contents of `scaffold/` are derived from an MIT-licensed AIOS scaffold by Nate Herk, the companion repo to his "Build & Sell Claude Code Operating Systems" course.

- **Upstream snapshot commit:** `b6b7a05`
- **Snapshot date:** 2026-05-02
- **License:** MIT (preserved verbatim in `THIRD_PARTY_LICENSES.md`)

### Trademark
"The Three Ms of AI™" is a trademark of Nate Herk. The framework content is MIT-licensed and may be used and redistributed; the trademark on the name itself is reserved.

### Upstream sync notes
- `.git` is intentionally stripped from the vendored copy — no auto-pulls.
- Before pulling any upstream change, diff against the current `scaffold/` and decide which deltas to take.
- When upstream is bumped, update the snapshot commit + date in this file.

### Local changes
- Removed upstream `LICENSE` and `README.md` from `scaffold/` (license preserved at repo root)
- Added `SESSION_HANDOFF.md` template
- Added production-baseline skills section to `CLAUDE.md`
- Layered our own integrations, prompts, scripts, and bootstrap script outside `scaffold/`
