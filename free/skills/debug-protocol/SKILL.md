---
name: debug-protocol
description: Use when investigating any bug, test failure, or unexpected behavior — enforces hypothesis-driven debugging instead of shotgun fixes, and stops the agent from "fixing" symptoms it hasn't reproduced
---

# Debug Protocol

Rigid skill. Follow in order. Do not skip steps because the bug "looks obvious" — obvious-looking bugs are where shotgun fixes waste the most time.

## Step 0 — Reproduce or stop
Before touching any code, reproduce the failure yourself (run the failing test, hit the endpoint, execute the repro steps). If you cannot reproduce it:
- Say so explicitly and gather more information (exact command, environment, logs).
- NEVER apply a speculative fix to an unreproduced bug. A fix you can't verify is a guess with a commit message.

## Step 1 — Capture the evidence
Write down (in your working notes, or a scratch file for long hunts):
- The exact error text / wrong output.
- The exact command that produces it.
- What changed recently (`git log --oneline -15`, `git diff HEAD~3` if relevant).

## Step 2 — Form ONE hypothesis
State a single falsifiable hypothesis: "X fails because Y." If you have three candidate causes, rank them by prior probability and test the top one first.

## Step 3 — Test the hypothesis with evidence, not edits
Prefer reads over writes: add a log line, run a narrower test, inspect state at the boundary. The goal is to see the broken value with your own eyes, one level above where it breaks.

- Hypothesis confirmed → Step 4.
- Hypothesis rejected → return to Step 2 with the new evidence. Log the rejected hypothesis so you don't retest it.
- Three consecutive rejected hypotheses → stop and re-read the evidence from scratch; you're probably debugging the wrong layer.

## Step 4 — Fix the cause, not the symptom
The fix should make the confirmed hypothesis impossible, not mask its output. If the fix is in a different file than the symptom, that's normal. If the fix is a try/catch around the symptom, that's a red flag — justify it or go back to Step 2.

## Step 5 — Prove it
1. Re-run the original repro → must pass.
2. Run the surrounding test suite → no new failures.
3. If no test caught this bug, write the missing test now (it should fail on the pre-fix code — verify by stashing the fix if cheap).

## Step 6 — Sweep
Search for the same pattern elsewhere (`grep` for the broken idiom). Same bug in three places fixed in one place is two future bug reports.

## Red flags that mean RESTART this protocol
- "Let me just try changing X and see if it helps."
- Editing code before reproducing.
- A fix that works but you can't explain why.
- Fixing more than one thing at once during diagnosis.
