# integrations

Reusable technical playbooks for systems the AIOS reaches into. Each playbook covers the universal patterns — auth, common build patterns, scope strategy, rate limits, anti-patterns — without hard-coding any company-specific configuration.

## Existing playbooks

- [`hubspot.md`](hubspot.md) — CRM integrations (deals, contacts, notes, custom properties)
- [`google-workspace.md`](google-workspace.md) — Gmail / Drive / Calendar / Sheets
- [`slack.md`](slack.md) — bot posting, Block Kit, slash commands

## Adding a new integration

When a company needs a new system integrated, write a new playbook here following the shape of the existing three. Suggested filename: `<system>.md` (lowercase, hyphenated).

Each playbook should cover:

1. **Auth** — token type, required scopes, where credentials live (`.env.local`, never committed)
2. **Common build patterns** — 3-6 reusable agent shapes (trigger / read / process / write)
3. **Scope strategy** — read-only first, write scopes added gradually
4. **Rate limits** — daily / per-second caps; caching strategy if tight
5. **Don't** — anti-patterns, common mistakes
6. **API docs** — direct links to the canonical reference

Keep it pure technical content. No methodology, no engagement model, no company-specific data.

## Common candidates

These are common SMB stack pieces that warrant a playbook the first time you integrate them:

- Telegram (ops alerts, bot messaging)
- Discord (community / team messaging)
- Notion (knowledge base read/write)
- Airtable (spreadsheet-as-database)
- Stripe (revenue, customer events)
- Calendly (booking, availability)
- Zapier / Make webhooks (universal glue)
- Generic webhook receivers

Write the playbook the first time you build the integration, not in advance. The integration teaches you what belongs in the playbook.
