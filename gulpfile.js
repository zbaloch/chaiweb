
var gulp = require('gulp'),
    watch = require('gulp-watch');

gulp.task('watch', function () {
    return watch('src/main/webapp/WEB-INF/jsp/**/*.*', () => {
        gulp.src('src/main/webapp/WEB-INF/jsp/**')
            //replace with build/resources/main/ for netBeans
            .pipe(gulp.dest('/Users/zaheerbaloch/Documents/devtools/apache-tomcat-8.5.56/webapps/chaiweb/WEB-INF/jsp/'));
    });
});

gulp.task('default', ['watch']);