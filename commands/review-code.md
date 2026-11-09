---
description: Review code changes for real problems, without editing
argument-hint: [file, branch or PR] (default: uncommitted changes)
---

Target: $ARGUMENTS

Review the given target. If none is given, review uncommitted changes. If there are none, review the latest commit. Do not edit files.

1. Read the diff and enough surrounding code to understand it. Judge the code as if someone else wrote it, and do not rely on earlier claims that it works.
2. Check for bugs, unhandled edge cases, security problems, data loss risks, missing tests and unneeded complexity.
3. Report only real problems, most severe first:

```markdown
**[Critical|Warning] `file:line`: {problem}**
- Impact: {when it fails and what happens}
- Fix: {suggested change}
```

Critical means a bug, security problem or data loss risk that should block the commit. Everything else is a warning. Skip style preferences.

4. End with a verdict: `Ready to commit` or `Needs fixes`. If no problems were found, say so and state what was checked.
