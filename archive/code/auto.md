---
description: ⚡⚡⚡ [AUTO] Implement and test a plan without approval stops ("trust me bro")
argument-hint: [plan] [all-phases: Yes|No] (default: latest plan, Yes)
---

Input: <plan>$ARGUMENTS</plan>

- `$1`: plan path. Default: latest plan.
- `$2`: `Yes` runs all remaining phases; `No` runs one phase, then asks before the next. Default: `Yes`.

Follow `./.claude/workflows/primary-workflow.md` with these changes:
- Skip Step 6 (Approve). Test and review gates still apply.
- In Step 2, stop and ask only for blockers that change scope or design.
- In Step 7, push only to a non-default branch. On the default branch, create a feature branch first.
- If a gate or the retry limit fails, stop the whole run.

After the last phase, give the final report. Ask whether to run `/preview` on it and `/plan:archive` on the plan.
