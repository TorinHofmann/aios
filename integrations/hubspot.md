# HubSpot Integration Starter

Common patterns for HubSpot integrations on SMB engagements. Adapt per-client; never paste client-specific field IDs into this file.

## Auth

- Use **Private Apps** (not OAuth) for sandbox-machine 24/7 agents. Simpler auth model, scopes per app.
- Required scopes (most engagements): `crm.objects.deals.read`, `crm.objects.contacts.read`, `crm.objects.companies.read`, `crm.notes.write` (only after Day 5 trust gate).
- Token lives in client's `.env.local` (never your machine).

## Day 1-2 discovery questions

- [ ] Which HubSpot account tier? (Starter / Professional / Enterprise — affects API rate limits + custom-property count)
- [ ] What custom properties exist on the Deal object? (Often the highest-leverage automation surface)
- [ ] What custom properties exist on Contact? Company?
- [ ] How are deals advanced through stages — manual click, workflow trigger, or external tool?
- [ ] What HubSpot workflows currently run? Document them; we don't want to duplicate or conflict.
- [ ] Where do leads enter the system? What's the first stage?

## Common build patterns

### Deal-summary auto-drafter
- Trigger: Gmail thread mentioning a deal name (or HubSpot deal updated)
- Read: Recent emails on the thread + current deal properties
- Process: Claude summarizes the latest activity into a 3-bullet update
- Write: Append to deal note OR draft an email reply (NOT auto-send)

### Renewal radar (mortgage, insurance, recurring B2B)
- Trigger: Anniversary of deal close (or N days before renewal date)
- Read: Original deal properties + contact email history
- Process: Claude drafts a personalized check-in
- Write: Slack DM to assigned rep with the draft + one-click "open Gmail draft" link

### Stale-deal Slack digest
- Trigger: Daily 8am cron
- Read: Deals in active pipeline > X days without update
- Process: Group by rep, format as digest
- Write: Slack post to #sales-daily

### Lead-source tagger
- Trigger: New contact created
- Read: Contact properties + source URL + UTM params
- Process: Claude classifies into custom source taxonomy
- Write: Update custom property `lead_source_classified`

## Read-only-first principle

For Week 1, scope to read-only. Builds that need write scope (notes, draft emails, property updates) wait until Day 5+ trust gate. This:
- Lets you show working agents Day 3-4 without write-risk
- Surfaces edge cases (rate limits, missing custom fields) before any data changes
- Builds owner trust gradually

## Rate limit notes

- Starter: 100 requests / 10 sec
- Professional: 150 requests / 10 sec
- Enterprise: 200 requests / 10 sec
- Daily cap: 250K-500K depending on tier

For 24/7 agents, batch reads and cache deal data in a local SQLite for the day. Don't poll the API for every check.

## Don't

- Don't build directly against the production HubSpot account from Day 1. Ask if they have a sandbox; use it for the first 2-3 builds.
- Don't auto-send any email from a HubSpot integration without owner sign-off. Always draft + human-approve.
- Don't write to custom properties without the team's existing data dictionary in front of you. You will collide.
- Don't paste field IDs from one client into another's `connections.md`. Each engagement is fresh.

## API docs to bookmark

- https://developers.hubspot.com/docs/api/overview
- https://developers.hubspot.com/docs/api/crm/properties (custom properties)
- https://developers.hubspot.com/docs/api/automation/workflows (don't duplicate existing workflows)
