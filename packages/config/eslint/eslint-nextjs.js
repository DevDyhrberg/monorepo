const config = require('./eslint-preset');

module.exports = {
    ...config,
    extends: [
        'next/core-web-vitals',
        'plugin:@typescript-eslint/recommended',
        'standard-with-typescript',
        'prettier',
    ],
    plugins: ['@typescript-eslint'],
};