const config = require('@monorepo-config/eslint/eslint-nextjs');

module.exports = {
    ...config,
    settings: {
        next: {
            rootDir: 'apps/first-app/',
        },
    },
    parserOptions: {
        ...config.parserOptions,
        project: ['./tsconfig.json'],
        tsconfigRootDir: __dirname,
    },
};
