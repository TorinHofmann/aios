# Google Workspace Integration Starter

Common patterns for Gmail / Drive / Calendar / Sheets integrations on SMB engagements.

## Auth

- **Day 1 install:** GWS CLI on owner's primary computer (`gcloud auth login` flow)
- **Sandbox machine:** service account with domain-wide delegation, scoped to the specific users / shared drives the agents need to access
- Token storage: client's `.env.local`, never your machine

## Day 1-2 discovery questions

- [ ] Domain managed by Google Workspace, or just personal Gmail? (Affects service-account approach)
- [ ] What shared Drives exist? Who has access to which?
- [ ] Folder structure — convention-driven or ad-hoc?
- [ ] What naming conventions for Sheets / Docs?
- [ ] Calendar: shared internal calendars vs. individual?
- [ ] Email volume per team member? (Drives Gmail-watching agent design)

## Common build patterns

### Gmail thread monitor → CRM note
- Trigger: New email from a known contact (HubSpot lookup)
- Read: Thread contents
- Process: Claude summarizes into a CRM-shaped note
- Write: Append to HubSpot deal record (or draft if write-scope not yet granted)

### Lender / vendor bulletin summarizer
- Trigger: Gmail rule on emails from specific senders (lender@bank.com)
- Read: Email body + attachments
- Process: Claude extracts policy changes, rate updates, deadlines
- Write: Slack post to #lender-updates with structured summary

### Shared Drive intake organizer
- Trigger: New file dropped into `/Intake/` folder
- Read: File contents (PDF / Doc / Sheet)
- Process: Claude classifies + extracts metadata
- Write: Move file to correct subfolder + post Slack notification

### Calendar prep digest
- Trigger: 6am daily
- Read: Today's meetings on owner's calendar
- Process: For each meeting, Claude pulls relevant context (contact's recent emails + CRM notes + last meeting summary)
- Write: Email digest to owner OR Slack DM

### Sheets-as-database pattern
- Many SMB clients use a Google Sheet as the source of truth for some operational data (lender matrix, pricing, inventory).
- Pattern: read sheet → cache locally → Claude reasons over the data → write back to sheet OR post to Slack
- Refresh cache hourly. Sheets API rate limits are tight for high-frequency polling.

## Scope strategy

| Phase | Scopes |
|---|---|
| Day 1-3 | `gmail.readonly`, `drive.readonly`, `calendar.readonly`, `sheets.readonly` |
| Day 5+ (after trust gate) | Add `gmail.compose` (draft only, never send), `drive.file` (specific files), `sheets` (specific sheets) |
| Week 3+ | `gmail.send` only if specific use case + owner sign-off |

Never request `gmail.modify` or `drive` (full) scope. Too broad, audit trail matters.

## Rate limits

- Gmail: 250 quota units/user/sec, daily user cap varies
- Drive: 1000 requests/100 sec/user
- Sheets: 60 read requests/min/user, 60 write requests/min/user (tight)
- Calendar: 1M requests/day/project

For Sheets-heavy workflows, batch operations + cache aggressively.

## Don't

- Don't OAuth into the owner's personal account if the work is for the business. Use service account + domain-wide delegation.
- Don't auto-send Gmail from any agent. Always draft, never send.
- Don't grant `drive` (full) scope. Use `drive.file` for specific files only.
- Don't poll Sheets faster than once per minute. You'll hit the rate limit.
- Don't paste OAuth tokens or service-account JSON into Slack / Notion / anywhere persistent unencrypted.

## API docs to bookmark

- https://developers.google.com/workspace
- https://developers.google.com/identity/protocols/oauth2/service-account (sandbox auth)
- https://developers.google.com/sheets/api/guides/values (most-used pattern)
