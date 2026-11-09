---
description: Implement a plan phase by phase, test, review and commit. Add "auto" to skip approval.
argument-hint: [plan-path] [auto]
---

Input: $ARGUMENTS

Use the given plan, or the newest file in `plans/`. If none exists, stop and suggest `/plan`.

For each incomplete phase:

1. **Check:** read the plan and relevant code. Ask if a blocker changes scope or design.
2. **Implement:** complete the tasks and tick their checkboxes in the plan.
3. **Test:** add tests for new behavior, then run type check, lint and tests. Fix the cause of any failure.
4. **Review:** review your own diff for bugs, security problems and unneeded code. Fix what you find.
5. **Approve:** report what changed and the test results, then wait for approval. If the input has `auto`, skip this step.
6. **Commit:** stage only related files and write a conventional commit message. Do not push unless asked.

When all phases are done, set `Status: done` in the plan and report what changed, the test command and result, commits, and open questions.
