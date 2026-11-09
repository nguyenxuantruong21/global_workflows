---
description: ⚡⚡ Implement one phase of an existing plan without writing or running tests
argument-hint: [plan] [phase]
---

Plan: <plan>$ARGUMENTS</plan>

Follow `./.claude/workflows/primary-workflow.md` with these changes:
- Skip Step 4 (Test). Type checking and compile in Step 3 are still required.
- In Step 5, fix critical issues and review again without running tests.
- In the final report, write `Tests: skipped`.
