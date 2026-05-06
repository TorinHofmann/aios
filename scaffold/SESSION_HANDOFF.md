# Session Handoff

**Read this file first at the start of every Claude session.** It is the living snapshot of where work stands. The most recent update wins. Overwrite, don't append.

---

## Last Updated

`{{ISO timestamp — update every time you save}}`

## Current Objective

What we're building right now and why.

```
{{1-3 sentences. Filled by /onboard initially; updated whenever the focus shifts.}}
```

## Status Right Now

What's working, what's broken, what's untested.

- ✅ Working: {{…}}
- 🔧 In progress: {{…}}
- ⚠️ Broken / blocked: {{…}}
- 🧪 Untested: {{…}}

## Files Touched This Session

Full paths, one-line change descriptions. Helps the next Claude jump in cold.

```
{{path/to/file.ext — what changed and why}}
```

## Key Decisions

Choices locked in this session, with reasoning. Append a one-liner here AND a full entry in `decisions/log.md`.

- {{decision — reason}}

## Context Not in Code

Verbal constraints, third-party quirks, gotchas that the code doesn't show.

- {{…}}

## Open Questions

Flagged items, unfixed bugs, deferred decisions.

- [ ] {{…}}

## Exact Next Steps

Literal next 3-5 actions in order. The next session opens with these.

1. {{…}}
2. {{…}}
3. {{…}}

## Commands & Environment

Anything non-obvious about how to run things — custom commands, env vars, running processes.

```
{{key commands or env notes}}
```

## Do NOT

Dead ends, things to avoid retrying, traps the previous session hit.

- {{…}}

---

## Rules for maintaining this file

1. **Overwrite each session, don't append.** It's a living snapshot, not a log. Historical context belongs in `decisions/log.md` or `archives/`.
2. **Update before the user signals end of session.** Don't wait to be asked.
3. **Update before any risky operation** (major refactor, destructive git command, dependency upgrade, deploy).
4. **At session start: read this file before doing anything else.** Confirm context, then ask the user "ready to continue with the next steps, or has something changed?"
5. **Err on the side of too much detail.** A fresh Claude with zero context should resume seamlessly.
