---
description: Write journal entries and archive or delete plans
argument-hint: [path-to-plan] (default: all plans)
---

Target: $ARGUMENTS. If empty, use all plans in `./plans`.

## Workflow
1. **Read** each `plan.md` and the first 20 lines of its phase files to get status.
2. **Journal:** ask whether to write journal entries. If yes, run `journal-writer` agents in parallel, saving to `./docs/journals/`. Cover key changes, impact and decisions.
3. **Choose:** ask which plans to process (selected, or completed only) and whether to move them to `./plans/archive` or delete them permanently. Show the exact list before any deletion.
4. **Apply** only the user's choice.
5. **Commit:** ask whether to run `/git:cm`, run `/git:cp`, or do nothing.

## Output
Report the counts and a table of affected plans (title, status, created date, action), plus journal entries created and any open questions.
