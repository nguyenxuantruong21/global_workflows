---
description: ⚡⚡⚡ Create an implementation plan with phases that can run in parallel
argument-hint: [task]
---

Task: <task>$ARGUMENTS</task>

Follow `/plan:hard`, and require `planner` to add the following.

## Phase rules
- Each file belongs to exactly one phase.
- Phases in a parallel group have no runtime dependency on each other and connect only through defined interfaces.
- Split by layer, feature domain or directory. Example: database, backend API and frontend run in parallel, then integration tests.

## Extra content
**In `plan.md`:** dependency graph, execution strategy (e.g. "Phases 1-3 parallel, then 4"), and file ownership matrix.

**In each phase file:** Parallelization Info (what can run alongside it and what it waits for), File Ownership, and Conflict Prevention.

Do not implement.
