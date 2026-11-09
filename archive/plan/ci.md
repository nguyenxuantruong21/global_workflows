---
description: Analyze GitHub Actions logs and plan the fix
argument-hint: [github-actions-url]
---

Run: $ARGUMENTS

Follow "Plans" in `./.claude/workflows/documentation-management.md`. Use `priority: P1` and `tags: [ci, bugfix]`.

Use `planner` to:
1. Read the logs with `gh` and find the root cause.
2. Describe at least 2 fixes, with pros, cons and a recommended option.
3. Write the plan.

Ask the user to confirm before implementing.
