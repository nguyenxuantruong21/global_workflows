---
description: Shared execution workflow used by all /code commands. Implement one plan phase, test, review, approve, finalize.
---

# Primary Workflow

Read `CLAUDE.md` and `./.claude/workflows/development-rules.md` first. The calling command states which steps change.

## 1. Select plan and phase
- Use the given plan and phase. If none given, use the latest plan: `find ./plans -name "plan.md" -type f -exec ls -t {} + 2>/dev/null | head -1`
- Pick the next incomplete phase (IN_PROGRESS first, then earliest pending).
- If no plan exists, stop and tell the user.

## 2. Analyze
- Read `plan.md` and the phase file completely.
- Create one todo per task. List dependencies, ambiguities and blockers.
- If a blocker changes scope or design, ask the user before coding.

## 3. Implement
- Complete tasks in order. Run type checking and compile; fix errors before continuing.
- Use `ui-ux-designer` for UI work, following `./docs/design-guidelines.md`.

## 4. Test
- Write tests for happy path, edge cases and error cases. Use `tester` to run the suite.
- If tests fail: use `debugger`, fix the cause, run again.
- Unit tests may mock external dependencies. Integration tests use a test environment. E2E tests use real, isolated data.
- Never comment out tests, weaken assertions, or defer fixes with TODO/FIXME.

**Gate:** all tests pass.

## 5. Review
- Use `code-reviewer` on all changes: security, performance, architecture, YAGNI/KISS/DRY.
- If critical issues exist: fix, re-run tests, review again.
- Critical means: security vulnerability, data loss, unmet requirement, or a measurable performance regression. Report everything else as a warning.

**Gate:** 0 critical issues.

## 6. Approve
Summarize what changed, test results and review outcome. Ask: "Approve changes?" Stop until the user answers.

**Gate:** explicit user approval.

## 7. Finalize
1. Use `project-manager` to mark the phase DONE and update the roadmap, and `docs-manager` to update docs. Run both in parallel.
2. List new setup requirements (API keys, env vars, config).
3. Stage only related files and commit with a conventional commit message. Push.

## Rules
- **Order:** follow steps in order. Do not continue past a failed gate.
- **Evidence:** report the exact test command and its real result. Never claim a check passed without running it.
- **Retry limit:** after 3 failed fix attempts on the same problem, stop and ask the user. Report what was tried.
- **Scope:** one phase per run, unless the command says otherwise.

## Final report
```
Plan/phase: [name]
Changed: [files]
Tests: [command] - [X/X passed]
Review: [0 critical, N warnings]
Commit: [hash or "not committed"]
Open questions: [list or "none"]
```
