/* eslint-disable */

require('babel-polyfill');
//require('isomorphic-fetch');

require('babel-register')({
    presets: ['es2015', 'stage-0'],
    plugins: [
        'add-module-exports',
        ["babel-plugin-module-alias", [
						{ "src": "./app", "expose": "app"},
						{ "src": "./constants", "expose": "constants" },
        ]]
    ]
});

require('./app/index');
