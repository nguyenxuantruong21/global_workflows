---
name: code-standards
description: General coding standards for any project and language, covering control flow, naming, constants, logging and file size, plus TypeScript and React rules. Use whenever writing, editing or reviewing code.
---

# Code Standards

## Priority
1. The project's own rules win: `CLAUDE.md`, lint config, contributor docs.
2. Then the conventions of the surrounding code.
3. Then this skill.

Apply these rules to new code. Rename existing names only on lines already being edited; never mass-rename.

## Control flow
- Prefer `if` with early return over `else` and deep nesting.
- Avoid the ternary operator unless the condition is certain to be a real truthy or falsy check, such as a boolean. If a value may be `0`, an empty string, `null` or `undefined`, use an explicit `if`.

## Naming
Use the language's own case style (camelCase, snake_case and so on). These prefixes and suffixes apply in any language.

- **Functions:** `getX` reads or derives a value, `calculateX` returns a number, `formatX` returns a display string, `buildX` / `createX` constructs an object, `asX` normalizes a type.
- **Boolean functions:** named ones start with `check`, never `checkIs`; keep `Can` / `Has` (`checkCanCompleteTask`). Inline callbacks and type guards are exempt.
- **Boolean variables:** start with `is` / `has` / `can` / `should`. A `check*` result takes the matching prefix: `isCargoArrivalTask = checkCargoArrivalTask(taskType)`.
- **Collections:** plural names; ID lists end in `Ids`, sets in `Set`, maps and lookup records in `Map`.
- **Units:** time and size values carry their unit: `timeoutMs`, `TIME_RANGE_MS`, `maxSizeKb`.
- **Meaning:** names state the business meaning, with correct singular or plural. No vague names (`data`, `temp`, `flag`, `value`, `item`, single letters outside trivial loop counters).
- **Constants:** `UPPER_SNAKE`. Group related values in one object or map with a plural name (`TASK_STATUSES`) instead of flat siblings.

## Code hygiene
- No magic numbers or strings in logic; name them as constants.
- Write code comments in English, never in Vietnamese.
- No leftover debug output or commented-out code. Keep error logging only where it is intentional.
- Disable a lint rule only on one line, with a comment giving the reason.
- Split a file that grows past about 500 lines instead of adding to it.

## TypeScript
- No `any` or unnecessary `as` casts. No `enum`; use an object `as const`.
- `interface` for object shapes; `type` for unions, aliases and utility types (`Pick`, `Omit`). No `I` prefix.
- Type suffixes: `Entity` for backend response shapes, `Base` for shared bases meant to be extended, `XProps` for props, `XState` for state.
- Import types with `import type`.
- Use the project's path alias instead of `../../` or deeper relative imports.
- No leftover `console.log` / `console.warn`. Use `console.error` only for intentional error logging.

## React
- Folders are kebab-case, component files PascalCase. A component's sibling files share its exact base name (`TaskDialog.tsx`, `TaskDialog.module.css`, `TaskDialog.test.tsx`).
- Hooks are `useX`.
- Handlers are `handleX`, callback props `onX` (never a prop named `handleX`), JSX helpers `renderX`: `<Modal onClose={handleClose} />`.
- `useState` pairs mirror each other: `[isSubmitting, setIsSubmitting]`.
- `open` is allowed as a boolean name for modal or popover visibility.
- Do not use an array index as `key` when items can be reordered, inserted or removed.
