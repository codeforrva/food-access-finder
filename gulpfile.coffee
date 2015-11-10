gulp       = require 'gulp'
browserify = require 'gulp-browserify'
concat     = require 'gulp-concat'
plumber    = require 'gulp-plumber'
sass       = require 'gulp-sass'

gulp.task 'browserify', ->
  gulp.src 'src/main.coffee',
    read: false
  .pipe plumber()
  .pipe browserify
    transform: ['coffeeify', 'jadeify']
  .pipe concat 'main.js'
  .pipe gulp.dest './dist/js'

gulp.task 'browserify:watch', ->
  gulp.watch './src/**/*.coffee', ['browserify']
  gulp.watch './src/**/*.jade', ['browserify']

gulp.task 'sass', ->
  gulp.src 'src/scss/app.scss'
  .pipe plumber()
  .pipe sass()
  .pipe gulp.dest './dist/css'

gulp.task 'sass:watch', ->
  gulp.watch './src/**/*.scss', ['sass']


gulp.task 'images', ->
  gulp.src './src/img/**/*.*'
  .pipe gulp.dest './dist/img/'

gulp.task 'watch', ['browserify:watch', 'sass:watch']

gulp.task 'default', ['watch']

gulp.task 'build', ['browserify', 'sass', 'images']

gulp.task "browserify:client", ->
  gulp.src 'src/templates/store_detail.jade',
    read: false
  .pipe plumber()
  .pipe browserify
    transform: ['jadeify']
  .pipe concat 'store_detail.js'
  .pipe gulp.dest './dist/templates'
