var gulp          = require('gulp');
var elm           = require('gulp-elm');
var watch         = require('gulp-watch')
var plumber       = require('gulp-plumber')
var runSequence   = require('run-sequence')

gulp.task('elm-init', elm.init);

gulp.task('build:elm', ['elm-init'], function() {
  return gulp.src('src/App.elm')
    .pipe(plumber())
    .pipe(elm.bundle('app.js'))
    .pipe(gulp.dest('dist/'));
});

gulp.task('default', ['build:elm'])

gulp.task('watch', function() {
  return watch('src/**/*.elm', function() {
    runSequence('build:elm')
  })
})
