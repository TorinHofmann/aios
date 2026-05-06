# Week 1: Shadow + Teach

The first week is **observation + onboarding the most-curious team member**, not building. Walk in empty-handed.

## Daily rhythm (Mon-Fri)

| Day | Where | What |
|---|---|---|
| Day 1 (Mon) | On-site | Run `/onboard` with owner morning, install GWS CLI mid-morning, shadow tech lead afternoon |
| Day 2 (Tue) | Remote | Read state files, organize observations, draft 3-question lists |
| Day 3 (Wed) | On-site | Continue shadow + introduce one team member to Claude on their own machine |
| Day 4 (Thu) | Remote | Research integrations relevant to candidate builds |
| Day 5 (Fri) | On-site | Run `/audit` morning, EOD synthesis with owner — pick Week 2 builds together |

(Adapt to client's actual schedule. Mon/Wed/Fri on-site is the default but flex.)

## Day 1 morning ritual

- [ ] Copy `scaffold/` into client's working directory (via `bootstrap.sh`)
- [ ] Customize `CLAUDE.md` with client's business context, glossary, terminology
- [ ] Customize `connections.md` with their actual stack (HubSpot fields, Drive structure, Slack channels)
- [ ] Customize `aios-intake.md` with client-specific Day-1 questions
- [ ] Run `/onboard` interview with owner (45 min)
- [ ] Install GWS CLI on owner's primary computer

## Day 1 afternoon: shadow the tech lead

**Two parallel goals:**

1. **Shadow** — map their actual workflows + identify highest-leverage builds. Document the data flow. Listen.
2. **Teach (introduce ONE Claude moment)** — pick a task they were already going to do, show the speed-up. Don't pitch tools. Don't onboard them on five things at once.

The shadow + teach happens **together, not separately**. While they work, you watch → suggest "let me show you something" → do ONE thing with Claude → they see the time savings → they keep working. Repeat across the days.

## Shadow checklist (Day 1-3)

- [ ] What tool does the team keep open most? What do they repeat most? What do they hate?
- [ ] Where is data stored: CRM custom + standard fields, Drive folder structure, Sheets tabs, Slack channels
- [ ] What are the manual handoffs? CRM → email → Slack → back? Document the friction points.
- [ ] What does the owner ask the team to do that they wish was automated?
- [ ] What does the team wish THEY could do that they don't have time for?

## EOD-Friday synthesis with owner (verbal, 30 min before EOD)

> "Here's what I saw across the week. Top 2-3 things I'd build that ship next week. Want me to go in that direction, or pick from a longer list?"

**Get sign-off before the weekend. Don't go into Monday with ambiguity about what ships.**

## 20%-dip warning

Frame upfront on Day 1 with the owner:

> "Days 2-5 the team's productivity may dip ~20%. They're learning a new tool while doing their job. By end of Week 2 they're 20%+ faster. This is normal and worth the friction — but I want you to know it's coming so nobody bails mid-engagement."

Without this warning, the dip causes panic. With it, everyone stays the course.

## Don't

- Pre-build any candidate build before Day 1 shadow — show up empty-handed.
- Pitch a specific dashboard / automation Day 1 — observations drive the pick.
- Commit to Week 2 scope before Friday EOD synthesis with owner.
- Over-teach Day 1 — ONE Claude moment is plenty. Don't onboard on five tools at once.
- Ship 5 things half-baked — two builds max, one per day, production-grade.
- Try to teach the entire team Week 1 — start with one (the most curious / technical), expand outward.
