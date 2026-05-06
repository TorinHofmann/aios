# Two-Track Architecture

Most engagements split AI usage into two parallel tracks. Both run from Day 1.

```
TRACK 1 — Interactive Claude (humans use directly)
  ├── You teach client team members on their own workstations
  ├── Pick the tool that matches their tech comfort:
  │     - Claude Code (technical / dev)
  │     - Claude.ai web UI (general knowledge work)
  │     - Claude Projects + skills (operations / process work)
  ├── Start with 1 person (the most curious / most technical), expand outward over weeks
  └── Demo ONE Claude moment per session — task they were already going to do, show the speed-up

TRACK 2 — Autonomous 24/7 Agents (sandbox machine)
  ├── Dedicated machine isolated from production data
  ├── Anthropic API + integration credentials (CRM, email, Slack, etc.)
  ├── Read-only scopes first, write scopes added gradually with audit logging
  ├── Outputs land in client's existing tools (Slack posts, CRM notes, Gmail drafts)
  └── No new UI — AI is invisible plumbing for these
```

## Why two tracks

The sandbox is for **secure 24/7 operation** (data isolation), NOT to gatekeep team usage of Claude. Most security-conscious clients hear "we'll keep AI in a sandbox" and assume their team can't touch Claude — that's a misread waiting to happen. Confirm Day 1 that team learning Claude on their own machines is a separate, parallel track.

## Onboarding sequence

| When | Who | What |
|---|---|---|
| Day 1 | Most-technical team member | Introduce Claude.ai or Claude Code via ONE recognizable task. Don't over-teach. |
| Day 1-2 | Same person | 3-5 self-driven tasks before EOD Friday. They feel the leverage themselves. |
| Day 1 | You + tech-lead | Set up sandbox machine: API key, network isolation, read-only credentials |
| Day 3-4 | You | Ship first 24/7 agent. Agent posts to Slack / writes Gmail draft / appends CRM note. |
| Week 2+ | Expand circle | Add second team member to interactive track. Add second 24/7 agent. |

## Anti-patterns

- ❌ Pitching the sandbox as "the AI thing" — clients tune out. It's invisible plumbing; the team-facing magic is interactive Claude.
- ❌ Trying to teach the entire team Claude in Week 1. Start with one person, expand.
- ❌ Building the sandbox machine before observing actual workflows — you'll automate the wrong thing.
- ❌ Giving write scopes to autonomous agents before Day 5. Read-only first, audit log everything, expand trust gradually.

## Hardware / setup notes

- **Sandbox machine:** dedicated mac mini OR a laptop you bring + plug into client's network. Confirm Day 1 with their tech lead which approach they prefer.
- **Network isolation:** sandbox should not have access to production databases. It reads via APIs (HubSpot, GWS, Slack) with explicit scopes.
- **Audit log:** every API call the sandbox agents make is logged to a local file (and ideally rotated weekly into the client's existing log system).
- **Anthropic billing:** client's own Anthropic account, not yours. They own the conversation history.
