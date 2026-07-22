---
name: pr-shipshape
description: Use before declaring any task done, committing, or opening a PR — a final-mile checklist that catches the five defects agents ship most often
---

# PR Shipshape

Rigid skill. Run the checklist top to bottom before saying "done". Each item is here because it's a defect class agents produce disproportionately.

## The checklist

**1. The diff is only the task.**
`git diff` and read it as a reviewer. Drive-by refactors, formatting churn in untouched functions, and "improvements" nobody asked for get reverted or split into their own commit. A reviewer should be able to state your diff's purpose in one sentence.

**2. Nothing is left running silent.**
Search the diff for: `console.log`, `print(`, `debugger`, `TODO`, `FIXME`, commented-out code, and hardcoded values that were "temporary" (URLs, IDs, sleeps, feature flags). Each one either becomes real code, an issue, or gets deleted.

**3. Error paths got the same care as happy paths.**
For every new `catch`/`except`/fallback in the diff: does it swallow an error the caller needs to know about? Empty catch blocks and `return null`-on-failure need explicit justification in the code.

**4. Tests prove the change, not just coexist with it.**
- New behavior → a test that fails without your change (know this, don't hope it).
- The full relevant suite ran AFTER your last edit — not before it. State the actual command and result.

**5. The claim matches the evidence.**
Say exactly what was verified: "tests pass" means you ran them and read the output. If something is unverified (needs staging, needs a secret, needs a human), say so explicitly instead of implying completeness.

## Output format
End with a short shipping note:
```
Done: <one sentence, what changed>
Verified: <commands run + results>
Not verified: <anything left, or "nothing">
Risk: <the one thing a reviewer should look at hardest>
```

That last line is not optional. Every diff has a riskiest line; naming it is what separates a teammate from a code generator.
