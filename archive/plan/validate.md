---
description: Validate a plan by interviewing the user on key decisions
argument-hint: [plan-path]
---

Plan: $ARGUMENTS. If empty, use the active plan from `## Plan Context`. If there is none, ask for a path or suggest `/plan:hard`.

## Workflow
1. **Read** `plan.md` and all `phase-*.md` files.
2. **Find decisions** that could significantly change implementation: architecture, assumptions, tradeoffs, risks, scope.
3. **Ask** with `AskUserQuestion`:
   - Use the range from `Validation: mode=X, questions=MIN-MAX`. Ask fewer if the plan has fewer real decisions.
   - Send at most 4 questions per call, each with 2-4 concrete options. Mark the best option "(Recommended)".
4. **Record** answers in `plan.md`. Do not change phase files.

```markdown
## Validation Summary
**Validated:** {date}
**Questions asked:** {count}

### Confirmed Decisions
- {decision}: {user choice}

### Action Items
- [ ] {plan change needed}
```

## Output
Report the number of questions, key decisions, and items needing revision. Recommend implementing or revising the plan first.
