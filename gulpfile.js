
var gulp = require('gulp'),
    watch = require('gulp-watch');

gulp.task('watch', function () {
    return watch('src/main/webapp/WEB-INF/jsp/**/*.*', () => {
        gulp.src('src/main/webapp/WEB-INF/jsp/**')
            //replace with build/resources/main/ for netBeans
            .pipe(gulp.dest('C:/Users/Zaheer Baloch/Documents/devtools/apache-tomcat-9.0.36/webapps/chaiweb/WEB-INF/jsp/'));

        //gulp.src('target/webapp-0.0.1-SNAPSHOT/**')
            //replace with build/resources/main/ for netBeans
            // .pipe(gulp.dest('C:\\Users\\Zaheer Baloch\\Documents\\devtools\\apache-tomcat-9.0.36\\webapps\\chaiweb\\'));

    });
});

gulp.task('default', ['watch']);