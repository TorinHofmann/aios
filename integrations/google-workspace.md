# Google Workspace Integration

Reusable technical patterns for Gmail / Drive / Calendar / Sheets integrations.

## Auth

- **Interactive use:** GWS CLI on the user's primary computer (`gcloud auth login`)
- **Autonomous agents:** service account with domain-wide delegation, scoped to specific users / shared drives
- Token storage: `.env.local`, never committed

## Common build patterns

### Gmail thread monitor → CRM note
- Trigger: New email from a known contact
- Read: Thread contents
- Process: Claude summarizes into a CRM-shaped note
- Write: Append to CRM record (or draft if write scope not granted)

### Lender / vendor bulletin summarizer
- Trigger: Gmail rule on emails from specific senders
- Read: Email body + attachments
- Process: Claude extracts policy changes, rate updates, deadlines
- Write: Slack post with structured summary

### Shared Drive intake organizer
- Trigger: New file dropped into `/Intake/` folder
- Read: File contents (PDF / Doc / Sheet)
- Process: Claude classifies + extracts metadata
- Write: Move file to correct subfolder + post Slack notification

### Calendar prep digest
- Trigger: Daily cron
- Read: Today's meetings on a user's calendar
- Process: For each meeting, Claude pulls relevant context (contact's recent emails + CRM notes + last meeting summary)
- Write: Email digest OR Slack DM

### Sheets-as-database pattern
- Many companies use a Google Sheet as the source of truth for some operational data
- Pattern: read sheet → cache locally → Claude reasons over the data → write back to sheet OR post to Slack
- Refresh cache hourly. Sheets API rate limits are tight for high-frequency polling.

## Scope strategy

| Phase | Scopes |
|---|---|
| Initial | `gmail.readonly`, `drive.readonly`, `calendar.readonly`, `sheets.readonly` |
| After verification | `gmail.compose` (draft only, never send), `drive.file` (specific files), `sheets` (specific sheets) |
| Last | `gmail.send` only with explicit owner sign-off + audit logging |

Never request `gmail.modify` or `drive` (full) scope. Too broad, audit trail matters.

## Rate limits

- Gmail: 250 quota units/user/sec, daily user cap varies
- Drive: 1000 requests/100 sec/user
- Sheets: 60 read requests/min/user, 60 write requests/min/user (tight)
- Calendar: 1M requests/day/project

For Sheets-heavy workflows, batch operations + cache aggressively.

## Don't

- Don't OAuth into a personal account if the work is for the business. Use service account + domain-wide delegation.
- Don't auto-send Gmail. Always draft, never send.
- Don't grant `drive` (full) scope. Use `drive.file` for specific files only.
- Don't poll Sheets faster than once per minute.
- Don't store service-account JSON in any committed file.

## API docs

- https://developers.google.com/workspace
- https://developers.google.com/identity/protocols/oauth2/service-account
- https://developers.google.com/sheets/api/guides/values
