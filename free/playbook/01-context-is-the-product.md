# Chapter 1 — Context Is the Product

You've seen the pattern: a session starts brilliant and ends confused. Hour one, the agent nails a refactor. Hour three, it's re-asking questions it answered itself, "fixing" code it wrote correctly, suggesting libraries you don't use. Most people conclude the model is inconsistent. The model didn't change — its context did.

## The model you should hold

An agent session has exactly one working memory: the context window. Everything the agent knows about *your* situation — your files, your constraints, your decisions, the error it saw four minutes ago — lives there, competing for space with every log line, every file dump, every dead end explored along the way.

So hold this model: **you are not managing an assistant; you are managing a budget.** Every token of noise crowds out a token of signal. The agent that read three 1,000-line files to answer one question is now measurably worse at the next question than the agent that read the right 40 lines — not because it got dumber, but because its memory is now 97% irrelevant.

This single idea explains the classic mysteries:

- *"It ignores my instructions late in the session"* — your instruction from hour one is now a needle in a haystack of tool output. Instructions don't decay because the model forgets; they decay because they're outnumbered.
- *"It keeps re-exploring the codebase"* — the earlier exploration was summarized or crowded out. Nothing pinned the conclusions.
- *"It's confident about stuff that's wrong"* — a summary of a summary of a file read an hour ago has the texture of knowledge without the substance.

## The three disciplines

Everything in this manual is downstream of three habits:

**1. Signal in, noise out.** Route noisy work — broad searches, log trawls, dependency archaeology — through subagents that return conclusions, not transcripts. Read files narrowly. Filter command output (`--quiet`, `grep`, `tail -20`) before it lands in context. The main session should contain decisions, constraints, and the working set. Chapter 6 covers the mechanics.

**2. Externalize what must survive.** Anything that would hurt to lose — the plan, decisions made, current status — goes in a file, updated as you work, not in conversational memory. Sessions compact; files don't. The test: if this session vanished right now, does a fresh one resume in two minutes from what's on disk? Chapter 10 builds the full workflow.

**3. Standing knowledge lives outside the conversation.** Your commands, conventions, and boundaries belong in CLAUDE.md (loaded every session, Chapter 2), process knowledge belongs in skills (loaded when relevant, Chapter 4), and hard rules belong in hooks (enforced deterministically, never "forgotten", Chapter 5). The conversation is for *this task*, not for re-teaching your environment every morning.

## Apply in 10 minutes

Open your last frustrating session transcript and count: how many total lines of tool output did the agent ingest, and how many did it actually need? The ratio is usually 20:1 or worse. Then do one thing: take the biggest noise source you found (usually a repeated build/test command or a fat file read) and decide where it should have gone — a filter, a subagent, or a narrower read. That one change typically buys back more quality than any prompt-engineering trick you've tried.

---
*Next: Chapter 2 — the CLAUDE.md structure that survives contact with reality.*
