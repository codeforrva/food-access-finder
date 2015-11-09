gulp       = require 'gulp'
browserify = require 'gulp-browserify'
concat     = require 'gulp-concat'
plumber    = require 'gulp-plumber'
sass       = require 'gulp-sass'

gulp.task 'browserify', () ->
  gulp.src 'src/main.js',
    read: false
  .pipe plumber()
  .pipe browserify
    transform: ['reactify']
  .pipe concat 'main.js'
  .pipe gulp.dest './dist/js'

gulp.task 'browserify:watch', () ->
  gulp.watch './src/**/*.js', ['browserify']

gulp.task 'sass', () ->
  gulp.src 'src/scss/app.scss'
  .pipe plumber()
  .pipe sass()
  .pipe gulp.dest './dist/css'

gulp.task 'sass:watch', () ->
  gulp.watch './src/**/*.scss', ['sass']

gulp.task 'watch', ['browserify:watch', 'sass:watch']

gulp.task 'default', ['watch']

gulp.task 'build', ['browserify', 'sass']
