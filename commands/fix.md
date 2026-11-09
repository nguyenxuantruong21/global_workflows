---
description: Fix a bug or make a small change, without a plan
argument-hint: [problem]
---

Problem: $ARGUMENTS

1. Reproduce the problem and find its root cause. If it cannot be reproduced, say so before changing code.
2. Make the smallest correct fix. Add a regression test when practical.
3. Run the relevant tests and review your diff.
4. Report the cause, the fix, the test command and its result. Do not commit unless asked.

If the work turns out to be large, stop and suggest `/plan`.
