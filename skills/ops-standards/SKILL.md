---
name: ops-standards
description: Project rules for the OpsAssist Dashboard 2.0 repo (React 19, TypeScript, Redux Toolkit, Apollo, Ant Design). Use only when working in that repo, together with code-standards. Overrides code-standards where they differ.
---

# OpsAssist Dashboard 2.0 Standards

## Priority
1. `.github/copilot-instructions.md` in the repo. Read it before writing or reviewing code, and follow it except where this skill corrects it.
2. This skill.
3. `code-standards`.

These rules are kept outside the repo on purpose. Do not edit `.github/copilot-instructions.md`, `eslint.config.js`, or other project config to add them.

## Corrections to copilot-instructions.md
- Redux uses RTK `createSlice`, as all slices do. Update state only through the slice's `<slice>Actions`; no direct state mutation outside reducers.
- `console.error` is allowed for intentional error logging. `console.log` and `console.warn` are not.
- Relative imports: `./` and one level of `../` are allowed. `../../` and deeper must use `@/`.

## Commands
- **Lint:** `npm run lint`, then the extra rules: `npx eslint <changed files> -c ~/.claude/skills/ops-standards/eslint.ops.config.mjs`. They report warnings only. New or edited code must not add warnings.
- **Build:** `npm run build`. It must pass with zero warnings.
- **Tests:** `npx vitest run`. Never run `npm run test`: it starts watch mode and never exits. Do not run `npm run test:e2e`: it opens the Playwright UI.

## Structure
- Shared UI → `src/components/common/`. Page-only components → `src/pages/<page>/components/<kebab-name>/`. A component's own children → its `components/` subfolder.
- Component shape: `const X = () => { … }`, then `export default memo(X)`.
- Hooks → `src/hooks/useX.ts`, as a named export.
- Services → `src/services/<domain>.ts`: pure functions, no JSX in new code, tests beside them as `<domain>.test.ts`.
- GraphQL → `src/graphql/<domain>/queries.ts` or `mutations.ts`, one `UPPER_SNAKE` constant per document. Flag-dependent fields use `enabledFeatures`.
- Validation → `src/validations/<form>.ts`, Yup schema named `xxxSchema`, messages via `i18n.t`.
- Redux → `createSlice` in `src/store/<slice>.ts`, exporting `<slice>Actions` and the reducer as default. Components read and dispatch only through `useAppSelector` / `useAppDispatch` from `@/store/hook`.

## Naming
- The `check` prefix for boolean functions applies to named module-level functions in `services/`, `utils/` and `hooks/`.
- "Ad hoc" is `ADHOC_` in constants and `adHoc` in camelCase (`adHocTask`, `AdHocTaskDialog`).
- Redux action objects are `<slice>Actions` (`authActions`).
- i18n root keys are camelCase (`taskMenu.removeTask`, not `TaskMenu.removeTask`).

## Placement
- Domain and shared types → `src/interfaces/<domain>.ts`, imported with `import type`. `Entity` types live only there.
- Props stay in the component file and are exported only if another file uses them. Redux state stays in its slice file and is not exported.
- Business and shared constants → `src/constants/<domain>.ts`, using the same domain names as `src/interfaces/`. A non-business value used by one file may stay at the top of that file.
- Feature-flag defaults → `src/constants/project-default-config.ts`, with the JSDoc block (Parent / true / false (Default)).

## Reuse existing helpers
- **Dates:** `tzDayjs` from `@/utils/datetime`. No `dayjs()` or `moment` outside `src/utils/datetime.ts`; importing the `Dayjs` type is fine.
- **Toasts and errors:** `notify` / `handleError` from `@/utils/common`.
- **Feature flags:** `enabledFeatures` / `isDesignV2` from `@/utils/project`.

## Git
- Work starts from `toronto-dev`. Branch names contain `tg-<number>`, except `hotfix`. Do not add a commit prefix; the hook adds it.
- A commit needs `npm run build` with zero warnings and no critical `npm audit` finding.
- Never stage or commit `plans/`.
