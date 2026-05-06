# aios

**Universal scaffold for building out a company's AI Operating System.**

Clone, run bootstrap, and any company has the foundation of an AI OS scaffolded into their working directory. Pure technical scaffolding — no methodology, no engagement model, no opinions about how the work should be sold. Just the OS.

## What's in here

```
aios/
├── README.md
├── LICENSE                         MIT
├── LICENSE-NATE.md                 Nate Herk's MIT preserved verbatim
├── BASED_ON.md                     Upstream attribution + snapshot commit
├── bootstrap.sh                    One-command setup
├── scaffold/                       ← copied into target/aios/ on bootstrap
│   ├── CLAUDE.md                   Claude Code entry point template
│   ├── connections.md              7-bucket data map (Revenue / Customer /
│   │                               Calendar / Comms / Tasks / Meetings /
│   │                               Knowledge)
│   ├── aios-intake.md              Onboarding interview template
│   ├── EXPANSIONS.md               Future-stack ideas
│   ├── decisions/log.md            Decisions journal
│   ├── archives/, context/         Working state
│   ├── references/3ms-framework.md The Three Ms of AI™ framework (MIT, ™ Nate Herk)
│   └── .claude/skills/             onboard / audit / level-up
├── integrations/                   Reusable per-system technical playbooks
│   ├── hubspot.md
│   ├── google-workspace.md
│   └── slack.md
├── prompts/                        Reusable prompt library
└── scripts/
    └── install-skills.sh           Install the production-baseline skills
```

## Use it

```bash
# In any company's working directory:
git clone https://github.com/torinhofmann/aios.git aios-tmp
./aios-tmp/bootstrap.sh
rm -rf aios-tmp

# Customize:
cd aios
$EDITOR CLAUDE.md           # add company business context
$EDITOR connections.md      # their actual stack
$EDITOR aios-intake.md      # company-specific onboarding questions

# Install production-baseline skills on the machine:
~/aios/scripts/install-skills.sh
```

That's it. The scaffold is now running.

## Production-baseline skills

`scripts/install-skills.sh` installs the foundation skill stack:

1. **Skill Creator** — meta-skill for building other skills
2. **Superpowers** — plan → test → review discipline
3. **GSD** — fresh sub-agents per task; fixes context rot
4. **Slash review** — built-in QA on commits
5. **Context Mode** — output compression, longer sessions
6. **Claude Mem** — local vector-search cross-session memory

Conditional: **Front-end Design** if the company will ship UI.

## Licensing + attribution

- **My work:** MIT. See [`LICENSE`](LICENSE).
- **Nate Herk's scaffold:** MIT, vendored into `scaffold/`. Original notice preserved at [`LICENSE-NATE.md`](LICENSE-NATE.md). Upstream commit + delta tracking in [`BASED_ON.md`](BASED_ON.md).
- "The Three Ms of AI™" is Nate Herk's trademark. Framework content is MIT; trademarked name reserved.

## Contributing back

This repo evolves as new skills, integrations, and scaffold improvements are validated. Knowledge gets stacked here — no per-company data, no opinions about delivery, no sales material. Pure scaffold.
