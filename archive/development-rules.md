---
description: Core engineering rules. YAGNI/KISS/DRY, real implementations, passing tests before push, conventional commits, no secrets.
---

# Development Rules

Always follow **YAGNI, KISS and DRY**. Activate only the skills the task needs.

## Code
- Follow the structure and standards in `./docs`.
- Name files in descriptive kebab-case, so their purpose is clear from the name alone.
- Aim to keep code files under 200 lines. Split by responsibility, not just to meet the number.
- Implement real behavior. Do not simulate features or leave mock implementations in production code.
- Update existing files. Do not create "enhanced" copies.
- Handle errors and edge cases where they can occur, and follow security best practices.
- Code must compile with no syntax errors. Prefer functionality and readability over strict style rules.
- Use `code-reviewer` after each implementation.

## Tools
Use when needed:
- `gh` for GitHub, `psql` for Postgres debugging.
- `docs-seeker` for latest package docs.
- `ai-multimodal` for reading or generating images, video and documents; `imagemagick` for editing them.
- `sequential-thinking` and `debugging` for complex analysis.

## Commit and push
- Run lint before commit and tests before push. Do not bypass failing tests.
- Keep commits focused. Use conventional commit messages with no AI references.
- Never commit secrets, such as `.env` files, API keys or database credentials.
