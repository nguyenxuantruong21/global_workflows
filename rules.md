# Working Rules

- Follow YAGNI, KISS and DRY. Follow the project's existing structure and conventions.
- Implement real behavior. Do not leave simulated or placeholder code.
- Never claim a check passed without running it. Report the exact command and result.
- Never comment out tests or weaken assertions to make them pass.
- After 3 failed attempts at the same problem, stop and report what was tried.
- Never commit secrets, such as `.env` files, API keys or credentials.
- Never push to the default branch or force push unless asked.
- Never commit on your own. Commit only when the user asks or approves it, or runs `/code` with `auto`.
- Never write code comments in Vietnamese. Write them in English.
- Prefer `if` with early return over `else` and deep nesting.
- Avoid the ternary operator unless the condition is certain to be a real truthy or falsy check, such as a boolean. If a value may be `0`, an empty string, `null` or `undefined`, use an explicit `if`.
