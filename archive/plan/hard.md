---
description: ⚡⚡⚡ Research, analyze and create an implementation plan
argument-hint: [task]
---

Task: <task>$ARGUMENTS</task>

Follow "Plans" in `./.claude/workflows/documentation-management.md`.

1. Run the pre-creation check.
2. Run up to 2 `researcher` agents in parallel, each on a different aspect, with at most 5 tool calls each.
3. Read the project docs. If `codebase-summary.md` is missing or older than 3 days, also run `/scout`.
4. Pass all report paths to `planner` to write the plan.
5. Ask the user to review the plan, then run the post-plan validation.

Do not implement.
