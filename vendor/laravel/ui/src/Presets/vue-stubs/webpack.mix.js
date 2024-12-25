const mix = require('laravel-mix');

/*
 |----------------------------------------------------------------------
 | Mix Asset Management
 |----------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining Webpack build steps.
 | We are compiling the Sass file for the application, bundling up
 | all JS files, and supporting React by using .react() method.
 |
 */

// JS and React compilation
mix.js('resources/js/app.js', 'public/js')
    .react() // enables React JSX/JS support
    .babelConfig({
        presets: ['@babel/preset-env', '@babel/preset-react']
    });

// Sass compilation
mix.sass('resources/sass/app.scss', 'public/css');

// Versioning (optional but recommended for production)
if (mix.inProduction()) {
    mix.version();
}

