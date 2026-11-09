---
description: ⚡ Implement a plan with parallel agents when its phases allow it
argument-hint: [plan-path]
---

Plan: <plan>$ARGUMENTS</plan>

Read `plan.md` and look for a dependency graph, execution strategy and file ownership matrix.

**If any of these is missing:** follow `./.claude/workflows/primary-workflow.md` for each phase in order.

**If all are present:**
1. Launch one `fullstack-developer` agent per phase in the parallel group. Pass each its phase file, environment info and owned files.
2. Wait for the group to finish. Verify no agent changed files outside its ownership. If one did, stop and report it.
3. Run dependent phases in order after their dependencies finish.
4. Continue from Step 4 (Test) of the primary workflow, covering all changes together.

Example: "Phases 1-3 parallel, then 4" → launch 3 agents → wait → launch 1 agent.
