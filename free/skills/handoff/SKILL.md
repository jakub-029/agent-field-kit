---
name: handoff
description: Use when ending a session with work unfinished, or when context is about to compact mid-task — writes the note that lets the next session (or the human) resume in two minutes instead of twenty
---

# Handoff

Flexible skill. Sessions end; work doesn't. The handoff note is the difference between resuming and re-archaeologizing. It goes in a file (HANDOFF.md, the plan file, or the repo's convention) — never only in the conversation, which is exactly what gets lost.

## The note

```markdown
# Handoff — <task> — <date>

## State: <one of: working / broken / half-migrated>
<One sentence: what is true RIGHT NOW. e.g. "New auth middleware written and
tested; old one still active; nothing routed through the new one yet.">

## Done
- <finished + VERIFIED items only. "Written but untested" goes under Next, not here.>

## Next (in order)
1. <the exact next action, specific enough to start cold: file, function, command>
2. ...

## Landmines
- <anything that will bite: "test X fails unrelated to this work", "don't rename Y,
  three services import it", "the flaky suite is flaky, rerun before believing it">

## Verify with
<the command(s) that prove the current state still holds>
```

## Rules
- **State first, honestly.** "Broken: migration half-applied, table renamed but code not updated" is a fine state to hand off — IF it's stated. The disaster is the note that implies "working" over a broken tree.
- **"Next" must survive zero context.** Write it for a reader who has this note and the repo, nothing else. "Continue the refactor" fails; "update the 4 remaining callers of getUser() in src/api/ to getUserById()" resumes.
- **Landmines are the love.** Everything you learned the hard way this session that isn't visible in the code goes here. This section is why the next session doesn't repeat your dead ends.
- Leave the working tree in the state the note claims: commit or stash what's described, revert experiments that aren't.

## The two-minute test
Before ending: read only the note, imagine starting cold. Can you begin useful work inside two minutes? If not, the note is missing its "Next 1." — fix that line first, it carries 80% of the value.
