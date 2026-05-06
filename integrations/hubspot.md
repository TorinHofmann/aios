# HubSpot Integration

Reusable technical patterns for HubSpot integrations.

## Auth

- **Private Apps** for backend / autonomous agents (simpler than OAuth, scopes per app)
- Required scopes for most reads: `crm.objects.deals.read`, `crm.objects.contacts.read`, `crm.objects.companies.read`
- Write scopes (add only after read paths verified): `crm.notes.write`, `crm.objects.deals.write`, etc.
- Token in `.env.local`, never committed

## Common build patterns

### Deal-summary auto-drafter
- Trigger: Gmail thread mentions a deal name (or HubSpot deal updated)
- Read: Recent emails on the thread + current deal properties
- Process: Claude summarizes the latest activity into a 3-bullet update
- Write: Append to deal note OR draft an email reply (NOT auto-send)

### Renewal radar (recurring B2B / mortgage / insurance)
- Trigger: Anniversary of deal close (or N days before renewal date)
- Read: Original deal properties + contact email history
- Process: Claude drafts a personalized check-in
- Write: Slack DM to assigned rep with the draft + Gmail-draft link

### Stale-deal Slack digest
- Trigger: Daily cron
- Read: Deals in active pipeline > X days without update
- Process: Group by rep, format as digest
- Write: Slack post

### Lead-source tagger
- Trigger: New contact created
- Read: Contact properties + source URL + UTM params
- Process: Claude classifies into custom source taxonomy
- Write: Update custom property `lead_source_classified`

## Read-only-first principle

Start with read-only scopes. Add write scopes only after read paths are verified and audited. This:
- Surfaces edge cases (rate limits, missing custom fields) before any data changes
- Lets you ship working agents fast without write-risk
- Builds confidence gradually before any automated writes hit production

## Rate limits (Private Apps)

| Tier | Rate | Daily cap |
|---|---|---|
| Starter | 100 / 10 sec | 250K |
| Professional | 150 / 10 sec | 500K |
| Enterprise | 200 / 10 sec | 500K |

For 24/7 agents, batch reads + cache deal data locally (SQLite). Don't poll the API for every check.

## Don't

- Don't build directly against the production HubSpot account if a sandbox is available.
- Don't auto-send any email from a HubSpot integration. Always draft + human-approve.
- Don't write to custom properties without the existing data dictionary in front of you. You will collide.
- Don't paste production tokens into any unencrypted shared surface.

## API docs

- https://developers.hubspot.com/docs/api/overview
- https://developers.hubspot.com/docs/api/crm/properties (custom properties)
- https://developers.hubspot.com/docs/api/automation/workflows (avoid duplicating existing workflows)
