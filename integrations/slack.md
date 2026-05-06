# Slack Integration

Reusable technical patterns for Slack integrations. Slack is usually the primary surface for AI-generated outputs — invisible plumbing, visible posts.

## Auth

- Create a **Slack app** in the target workspace
- **Bot token** (`xoxb-...`) for posting
- **User token** (`xoxp-...`) only when an agent must impersonate a specific human (rare)
- Required scopes for most engagements: `chat:write`, `channels:read`, `chat:write.customize`, `users:read`
- Token in `.env.local`

## Common build patterns

### Daily team digest
- Trigger: Daily cron (e.g., 8am)
- Read: CRM stale deals + calendar today + recent activity
- Process: Claude synthesizes "what to focus on today"
- Write: Post to morning channel

### Deal-stage notifier
- Trigger: CRM deal advances to specific stage
- Read: Deal properties + contact info
- Process: Claude formats a contextualized one-liner
- Write: Post to deals channel with @-mention to assigned rep

### Lender / vendor bulletin posts
- Trigger: New email from specific senders
- Read: Email body
- Process: Claude extracts the policy / rate / deadline change
- Write: Structured post to relevant channel

### Q&A bot
- Trigger: Slash command `/ask <question>`
- Read: Internal docs (Drive, Notion, knowledge base)
- Process: Claude answers grounded in the docs
- Write: Reply ephemerally OR in-thread

### Daily wrap
- Trigger: EOD cron
- Read: Day's CRM activity + emails sent + meetings held
- Process: Claude summarizes wins, friction points, tomorrow's prep
- Write: DM to owner OR post in private leadership channel

## Block Kit

Use Block Kit for any post longer than 2 lines. Plain-text walls of bot output are tuning-out fodder; structured blocks (headers, dividers, accessory buttons) feel intentional.

```json
{
  "blocks": [
    {"type": "header", "text": {"type": "plain_text", "text": "Daily Brief — Mon May 5"}},
    {"type": "context", "elements": [{"type": "mrkdwn", "text": "_Generated 8:00am_"}]},
    {"type": "divider"},
    {"type": "section", "text": {"type": "mrkdwn", "text": "*3 deals need attention today:*"}},
    {"type": "section", "text": {"type": "mrkdwn", "text": "• Deal A — last contact 5 days ago\n• Deal B — anniversary in 3 days\n• Deal C — stalled in underwriting"}}
  ]
}
```

## Naming convention

- Bot username: `Claude · Brief` / `Claude · Renewals` etc — prefix with "Claude" so users know which posts are AI
- Custom emoji avatar per agent
- Avoid generic names ("BotBot") — users won't trust them

## Don't

- Don't post to busy channels at high frequency. Pick one channel per agent, or one daily window.
- Don't @-mention everyone. Per-agent targeting only.
- Don't auto-reply in threads unless explicitly designed for it.
- Don't put OAuth tokens in plaintext in any committed file. `.env.local` only.

## API docs

- https://api.slack.com/web
- https://api.slack.com/block-kit
- https://api.slack.com/scopes
