# prompts

Reusable prompts that the AIOS calls repeatedly. Drop them here as you build them — don't pre-populate this directory with hypothetical prompts you might use later.

## Naming

`<verb>-<noun>.md` — lowercase, hyphenated, one prompt per file.

Examples:
- `summarize-email.md`
- `daily-digest.md`
- `draft-followup.md`
- `extract-action-items.md`

## Shape

Each prompt file should include:

1. **When to use** — what triggers this prompt, what the upstream / downstream is
2. **Inputs** — what data gets templated in (use `{{placeholder}}` syntax)
3. **The prompt** — the actual text sent to Claude
4. **Expected output shape** — JSON schema, markdown structure, or example output

## Writing prompts that survive

- Be specific about constraints up front (length, format, tone)
- Give examples of good and bad output if the format matters
- Use system / user role separation if the framing differs from the task
- If the prompt depends on company voice, reference `references/voice.md` rather than inlining samples
