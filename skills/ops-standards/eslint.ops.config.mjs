// Extends the OpsAssist ESLint config with extra warn-level rules, without editing the project.
// Run from the project root: npx eslint . -c <path-to-this-file>
import path from 'node:path';
import { pathToFileURL } from 'node:url';

const projectConfigUrl = pathToFileURL(path.join(process.cwd(), 'eslint.config.js')).href;
const { default: projectConfig } = await import(projectConfigUrl);

export default [
  ...projectConfig,
  {
    files: ['**/*.{ts,tsx}'],
    rules: {
      '@typescript-eslint/no-explicit-any': 'warn',
      'no-console': ['warn', { allow: ['error'] }],
      'no-restricted-imports': [
        'warn',
        { patterns: [{ group: ['../../*'], message: 'Use the @/ alias instead of deep relative imports.' }] },
      ],
    },
  },
];
