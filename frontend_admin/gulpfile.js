var gulp = require('gulp');
var sass = require('gulp-sass');
var concat = require('gulp-concat');
var merge = require('merge-stream');
var minify = require('gulp-clean-css');

gulp.task('default',function() {
    gulp.watch('sass/**/*.scss', ['styles']);
});

gulp.task('styles', function() {
    
    var scssStream = gulp.src('sass/**/*.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(concat('/sass/scss-files.scss'));

    var cssStream = gulp.src('/sass/**/*.scss')
        .pipe(concat('css-files.css'));

    var mergedStream = merge(scssStream, cssStream)
        .pipe(concat('styles.min.css'))
        .pipe(minify())
        .pipe(gulp.dest('./css/'));

    return mergedStream;
});
