# Slack Integration Starter

Common patterns for Slack integrations on SMB engagements. Slack is usually the team's primary surface for AI-generated outputs — invisible plumbing, visible posts.

## Auth

- Create a **Slack app** in the client's workspace (not yours). Owner approves.
- Use **bot token** (`xoxb-...`) for posting, **user token** (`xoxp-...`) only when the agent must impersonate a specific human (rare).
- Required scopes most engagements: `chat:write`, `channels:read`, `chat:write.customize` (for icon/name per agent), `users:read` (for @mentions)
- Token lives in client's `.env.local`

## Day 1-2 discovery questions

- [ ] Channel structure — what exists, who's in what?
- [ ] Norms — do they prefer threaded replies or new posts? @-mentions or none? Emojis?
- [ ] Existing bots / integrations — which channels are already noisy?
- [ ] Workflow Builder usage — are there existing automations we shouldn't duplicate?
- [ ] DM vs. channel for agent outputs? (Some teams hate bot-DMs; others prefer them.)

## Common build patterns

### 8am team digest
- Trigger: 8am daily cron
- Read: HubSpot stale deals + GWS calendar today + recent activity
- Process: Claude synthesizes "what to focus on today"
- Write: Post to `#sales-daily` (or whichever the team's morning channel is)

### Deal-stage notifier
- Trigger: HubSpot deal advances to specific stage
- Read: Deal properties + contact info
- Process: Claude formats a contextualized one-liner
- Write: Post to `#deals` channel with @-mention to assigned rep

### Lender / vendor bulletin posts
- Trigger: New email from specific senders
- Read: Email body
- Process: Claude extracts the policy / rate / deadline change
- Write: Structured post to `#lender-updates` (or vendor equivalent)

### Q&A bot
- Trigger: Slash command `/ask <question>`
- Read: Internal docs (Drive, Notion, knowledge base)
- Process: Claude answers grounded in the docs
- Write: Reply ephemerally OR in-thread (depends on team norms)

### Daily wrap
- Trigger: 5pm daily cron
- Read: Day's CRM activity + emails sent + meetings held
- Process: Claude summarizes wins, friction points, tomorrow's prep
- Write: DM to owner OR post in private `#leadership` channel

## Block Kit

Use Block Kit for any post longer than 2 lines. Plain text walls of bot output are tuning-out fodder; structured blocks (headers, dividers, accessory buttons) feel intentional.

Tor's preferred Block Kit pattern for digests:

```json
{
  "blocks": [
    {"type": "header", "text": {"type": "plain_text", "text": "Daily Brief — Mon May 5"}},
    {"type": "context", "elements": [{"type": "mrkdwn", "text": "_Generated 8:00am · TorOS_"}]},
    {"type": "divider"},
    {"type": "section", "text": {"type": "mrkdwn", "text": "*3 deals need attention today:*"}},
    {"type": "section", "text": {"type": "mrkdwn", "text": "• Deal A — last contact 5 days ago\n• Deal B — anniversary in 3 days\n• Deal C — stalled in underwriting"}}
  ]
}
```

## Naming convention

- Bot username: `Claude · Brief` or `Claude · Renewals` etc — prefix with "Claude" so users know which posts are AI
- Custom emoji avatar per agent (cheap, makes them legible at a glance)
- Don't use generic bot names ("BotBot") — the team won't trust them

## Don't

- Don't post to busy channels at high frequency. Pick one channel per agent, or one daily window.
- Don't @-mention everyone. Per-agent targeting only.
- Don't auto-reply to threads unless the team specifically asks. Agents post; humans discuss.
- Don't put OAuth tokens in plaintext in any committed file. `.env.local` only.

## API docs to bookmark

- https://api.slack.com/web (Web API)
- https://api.slack.com/block-kit (rich post formatting)
- https://api.slack.com/scopes (full scope reference)
