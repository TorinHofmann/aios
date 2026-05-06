# aios

**Client-services scaffold for AI implementation engagements.**

This is the master toolkit Torin Hofmann uses to onboard, deliver, and document AI Operating System engagements at SMB clients. Everything in here is reusable across clients. Client-specific data (CRM fields, lender names, internal docs, NDAs) never lives here — it stays in per-client folders.

> Private repo. Add per-engagement collaborators as read-only.

## What's in here

```
aios/
├── README.md                       This file
├── LICENSE                         MIT (Torin Hofmann's contributions)
├── LICENSE-NATE.md                 MIT (Nate Herk's scaffold)
├── BASED_ON.md                     Upstream attribution + snapshot commit
├── bootstrap.sh                    One-command client setup
├── scaffold/                       ← copied into <client>/aios/ on bootstrap
│   ├── CLAUDE.md
│   ├── connections.md              7-bucket data map template
│   ├── aios-intake.md              Day-1 onboarding interview
│   ├── decisions/log.md
│   ├── archives/, context/, references/
│   └── .claude/skills/             onboard / audit / level-up
├── playbooks/                      Engagement workflow docs
│   ├── two-track-architecture.md
│   ├── week-1-shadow-and-teach.md
│   ├── friday-eod-synthesis.md
│   ├── pricing-and-offramp.md
│   └── 20-percent-dip-warning.md
├── integrations/                   Reusable per-system playbooks
│   ├── hubspot.md
│   ├── google-workspace.md
│   └── slack.md
├── prompts/                        Reusable prompts (per-engagement adds)
└── scripts/
    └── install-skills.sh           6-skill production baseline installer
```

## How to use it on a new engagement

```bash
# In your client folder (e.g., ~/work/<client-name>/)
git clone https://github.com/torinhofmann/aios.git aios-tmp
./aios-tmp/bootstrap.sh
rm -rf aios-tmp

# Then customize the freshly created aios/
cd aios
$EDITOR CLAUDE.md          # add client business context
$EDITOR connections.md     # their actual CRM / GWS / Slack
$EDITOR aios-intake.md     # client-specific Day-1 questions

# Install production tooling on the client machine
~/aios/scripts/install-skills.sh
```

After that:
1. Day 1 morning — run `/onboard` skill with client owner
2. Day 1-2 — shadow tech lead, introduce ONE Claude moment
3. Friday EOD — synthesize observations with owner, pick Week 2 builds
4. Mon/Tue Week 2 — ship 2 production-grade builds

Full sequence in [`playbooks/week-1-shadow-and-teach.md`](playbooks/week-1-shadow-and-teach.md).

## Engagement model

- **Pricing:** $6K/week, weekly off-ramp. See [`playbooks/pricing-and-offramp.md`](playbooks/pricing-and-offramp.md).
- **Cadence:** Mon/Wed/Fri on-site, Tue/Thu remote (research + prompt design).
- **Architecture:** two-track — interactive Claude (team workstations) + autonomous 24/7 agents (sandbox machine). See [`playbooks/two-track-architecture.md`](playbooks/two-track-architecture.md).
- **Trajectory:** 4 wks = $24K / 6 wks = $36K / 8 wks = $48K + Phase 2 / 12 wks = $72K long-arc.

## Production tooling baseline

Every engagement gets these 6 skills installed before any production build ships (per Nate Herk's "100+ Claude Code Skills" analysis):

1. **Skill Creator** — meta-skill for building other skills (`/plugin install skill-creator`)
2. **Superpowers** — forces plan → test → review discipline
3. **GSD** — fresh sub-agents per task; fixes context rot
4. **Slash review** (built-in) — default QA on commits
5. **Context Mode** — output compression, 3hr sessions
6. **Claude Mem** — local vector-search cross-session memory; eliminates the "re-explain the project" startup tax for client team after the consultant leaves

Conditional add-on: **Front-end Design** skill — install only if the engagement ships client-facing UI.

Run `scripts/install-skills.sh` on the client's primary machine Day 1.

## What does NOT live in this repo

- Client-specific data (CRM custom fields, internal terminology, lender names, etc.)
- API keys / credentials of any kind
- Pricing PDFs, signed proposals, NDAs
- Anything under client confidentiality

Per-client work lives outside this repo, customized from the scaffolded `aios/` folder.

## Licensing + attribution

- **My work:** MIT. See [`LICENSE`](LICENSE).
- **Nate Herk's scaffold:** MIT-licensed, vendored into `scaffold/`. Original notice preserved at [`LICENSE-NATE.md`](LICENSE-NATE.md). Upstream commit + delta tracking in [`BASED_ON.md`](BASED_ON.md).
- "The Three Ms of AI™" is Nate Herk's trademark. Framework content is MIT; the trademarked name is reserved.

## Contact

Torin Hofmann · contact@torinhofmann.com · [torinhofmann.com](https://torinhofmann.com)
