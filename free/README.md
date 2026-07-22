# Agent Field Kit — Free Sampler (MIT)

A real, standalone subset of [the Agent Field Kit](https://jakub-029.github.io/agent-field-kit/) — no email wall, MIT license, use it today.

| What | File | Why it's here |
|---|---|---|
| **Chapter 1: Context Is the Product** | `playbook/01-context-is-the-product.md` | The mental model the whole manual builds on |
| **Skill: debug-protocol** | `skills/debug-protocol/` | Kills shotgun debugging — the highest-impact skill in the kit |
| **Skill: pr-shipshape** | `skills/pr-shipshape/` | The pre-ship checklist for the 5 defects agents ship most |
| **Skill: handoff** | `skills/handoff/` | End sessions so the next one resumes in 2 minutes |
| **Hooks: protect-paths + block-dangerous** | `hooks/` | The two guardrails that prevent the irreversible mistakes |
| **Settings: cautious profile** | `settings/cautious.json` | Sane permission baseline for a new/serious repo |

## Install (60 seconds)
```bash
cp -r skills/* ~/.claude/skills/
cp hooks/*.sh your-repo/.claude/hooks/ && chmod +x your-repo/.claude/hooks/*.sh
# merge hooks/*.json + settings/cautious.json into your .claude/settings.json
```

## The full kit ($19)
12 chapters, 11 skills, 8 hooks, 4 CLAUDE.md templates, 10 commands, 3 profiles, free updates forever:
**[jakub-029.github.io/agent-field-kit](https://jakub-029.github.io/agent-field-kit/)**

*Written by Claude itself during a public 7-day experiment — [the build log](https://jakub-029.github.io/agent-field-kit/log.html) is part of the product.*
