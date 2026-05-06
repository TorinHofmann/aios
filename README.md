# aios

**Universal scaffold for building out a company's AI Operating System.**

Clone, run bootstrap, and any company has the foundation of an AI OS scaffolded into their working directory. Pure technical scaffolding — no methodology, no engagement model, no opinions about how the work should be sold. Just the OS.

## What's in here

```
aios/
├── README.md
├── LICENSE
├── bootstrap.sh                    One-command setup
├── scaffold/                       ← copied into target/aios/ on bootstrap
│   ├── CLAUDE.md                   Claude Code entry point template
│   ├── SESSION_HANDOFF.md          Session-state file Claude reads first
│   ├── connections.md              7-bucket data map (Revenue / Customer /
│   │                               Calendar / Comms / Tasks / Meetings /
│   │                               Knowledge)
│   ├── aios-intake.md              Onboarding interview template
│   ├── EXPANSIONS.md               What to add as the AIOS grows
│   ├── decisions/log.md            Decisions journal
│   ├── archives/, context/         Working state
│   ├── references/                 Frameworks + voice samples + API guides
│   └── .claude/skills/             /onboard, /audit, /level-up
├── integrations/                   Reusable per-system technical playbooks
│   ├── hubspot.md
│   ├── google-workspace.md
│   └── slack.md
├── prompts/                        Reusable prompt library
└── scripts/
    └── install-skills.sh           Install the production-baseline skills
```

## Use it

Two ways. Pick whichever fits the machine.

### Option A — let Claude Code do it for you (easiest)

Open Claude Code on the target machine (any directory) and tell it:

> Follow the setup instructions at https://github.com/torinhofmann/aios. Clone the repo, run the bootstrap into this directory, install the production-baseline skills, and walk me through customizing CLAUDE.md and connections.md for this company.

Claude reads the repo, runs the commands, asks for company context inline. Done.

### Option B — manual commands

```bash
# 1. Clone the kit somewhere persistent on the machine
git clone https://github.com/torinhofmann/aios.git
cd aios

# 2. Bootstrap a scaffold into the company's working folder
./bootstrap.sh /path/to/company-project

# 3. Install production-baseline skills (idempotent — safe to re-run)
./scripts/install-skills.sh

# 4. Customize the bootstrapped scaffold
cd /path/to/company-project/aios
$EDITOR CLAUDE.md           # add company business context
$EDITOR connections.md      # their actual stack
$EDITOR aios-intake.md      # company-specific onboarding questions
```

That's it. The scaffold is running.

The cloned `aios/` folder stays around — `git pull` later for updates, re-run `install-skills.sh` if a new machine joins, browse `integrations/` for new system playbooks as you connect them.

## Production-baseline skills

`scripts/install-skills.sh` installs the foundation skill stack:

1. **Skill Creator** — meta-skill for building other skills
2. **Superpowers** — plan → test → review discipline
3. **GSD** — fresh sub-agents per task; fixes context rot
4. **Slash review** — built-in QA on commits
5. **Context Mode** — output compression, longer sessions
6. **Claude Mem** — local vector-search cross-session memory

Conditional: **Front-end Design** — install only if shipping UI.

## Session protocol

Every Claude session opens by reading `SESSION_HANDOFF.md` — the living snapshot of current objective, what's working / broken, exact next steps. Updated mid-session whenever a decision lands or a file is touched. This kills the "re-explain the project" tax at the start of every session.

## Stacking knowledge

This repo evolves as new skills, integrations, and scaffold improvements are validated. No per-company data, no opinions about delivery, no sales material — pure scaffold.

## License + credits

MIT. See [`LICENSE`](LICENSE).

Built on the foundation of an MIT-licensed AIOS scaffold by Nate Herk — full attribution + upstream tracking in [`ATTRIBUTION.md`](ATTRIBUTION.md), preserved license in [`THIRD_PARTY_LICENSES.md`](THIRD_PARTY_LICENSES.md).
