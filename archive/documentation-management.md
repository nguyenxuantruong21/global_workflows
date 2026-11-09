---
description: Shared standard for project docs and plans. Which docs to update and when; plan checks, structure and file contents.
---

# Documentation Management

## Project docs
| File | Purpose |
|---|---|
| `./docs/development-roadmap.md` | Phases, milestones and progress |
| `./docs/project-changelog.md` | Significant changes, features and fixes |
| `./docs/system-architecture.md` | System design, main components and how they interact |
| `./docs/code-standards.md` | Coding conventions, codebase structure and quality standards |

## When to update
`project-manager` updates docs when:
- A phase changes status, or a major feature ships: roadmap and changelog.
- A bug or security issue is fixed: changelog, with severity and impact.
- Scope, timeline, dependencies or breaking changes occur: roadmap and changelog.

Read the current doc first. Afterward, verify that links and dates are correct and the content matches what was actually built.

# Plans

## Pre-creation check
Check `## Plan Context`:
- `Plan: {path}`: ask whether to continue with this active plan.
- `Suggested: {path}`: ask whether to activate it or create a new plan.
- `Plan: none`: create a new plan.

For a new plan, create the directory from `Plan dir:` in `## Naming`, then run `node .claude/scripts/set-active-plan.cjs {plan-dir}`. Pass the directory path to every subagent.

## Structure
```
plans/251101-1505-authentication-and-profile/
├── research/researcher-XX-report.md
├── reports/XX-report.md
├── scout/scout-XX-report.md
├── plan.md
└── phase-XX-phase-name.md
```

## plan.md
Keep under 80 lines. List each phase with status and link, plus key dependencies. Start with:
```yaml
---
title: "{Brief title}"
description: "{One sentence}"
status: pending
priority: P2
effort: {sum of phases, e.g. 4h}
branch: {current git branch}
tags: [relevant, tags]
created: {YYYY-MM-DD}
---
```

## phase-XX-name.md
Follow `./.claude/workflows/development-rules.md`. Include these sections in order:
1. **Context Links:** related reports, files and docs
2. **Overview:** date, priority, status, brief description
3. **Key Insights:** research findings and critical considerations
4. **Requirements:** functional and non-functional
5. **Architecture:** design, component interactions, data flow
6. **Related Code Files:** files to modify, create and delete
7. **Implementation Steps:** detailed and numbered
8. **Todo List:** checkboxes
9. **Success Criteria:** definition of done and how to verify
10. **Risk Assessment:** issues and mitigations
11. **Security Considerations:** auth and data protection
12. **Next Steps:** dependencies and follow-ups

## Post-plan validation
Check `Validation: mode=X, questions=MIN-MAX` in `## Plan Context`:
- `prompt`: ask "Validate this plan with a brief interview?" If yes, run `/plan:validate {plan-path}`.
- `auto`: run `/plan:validate {plan-path}`.
- `off`: skip.

## Report rules
- Be concise; grammar may be sacrificed for brevity.
- Keep research reports to 150 lines or fewer, with citations.
- List open questions at the end.
