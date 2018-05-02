var gulp          = require('gulp');
var elm           = require('gulp-elm');
var watch         = require('gulp-watch')
var plumber       = require('gulp-plumber')
var connect       = require('gulp-connect')
var runSequence   = require('run-sequence')

gulp.task('elm-init', elm.init);

gulp.task('build:elm', ['elm-init'], function() {
  return gulp.src('src/App.elm')
    .pipe(plumber())
    .pipe(elm.bundle('app.elm.js'))
    .pipe(gulp.dest('dist/'));
});

gulp.task('watch', function() {
  return watch('src/**/*.elm', function() {
    runSequence('build:elm')
  })
})

gulp.task('webserver', function() {
  connect.server({
    livereload: true,
    // port:       80,
    // host:       'achille.dev'
  });
});

gulp.task('dev', ['webserver','build:elm', 'watch'])

gulp.task('default', ['build:elm'])
