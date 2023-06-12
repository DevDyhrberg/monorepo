const config = require('@monorepo-config/eslint/eslint-preset');

module.exports = {
    ...config,
    parserOptions: {
        ...config.parserOptions,
        project: ['./tsconfig.json'],
        tsconfigRootDir: __dirname,
    },
};
