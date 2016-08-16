(function() {
  module.exports = function(grunt) {
    require('load-grunt-tasks')(grunt);
    grunt.initConfig({
      pkg: grunt.file.readJSON('./package.json'),
      clean: 'dist',
      coffeelint: {
        app: ['src/**/*.coffee', 'Gruntfile.coffee']
      },
      coffee: {
        grunt: {
          src: 'Gruntfile.coffee',
          dest: 'Gruntfile.js'
        },
        app: {
          expand: true,
          flatten: true,
          cwd: 'src/',
          src: ['js/**/*.coffee'],
          dest: 'src/js',
          ext: '.js'
        }
      },
      copy: {
        common: {
          files: [
            {
              expand: true,
              cwd: 'src/public_html',
              src: '**',
              dest: 'dist/'
            }, {
              expand: true,
              cwd: 'src/fonts',
              src: '**',
              dest: 'dist/fonts'
            }, {
              expand: true,
              cwd: 'src/img',
              src: '**',
              dest: 'dist/img'
            }, {
              expand: true,
              cwd: 'src/css/img',
              src: '**',
              dest: 'dist/css/img'
            }
          ]
        },
        css: {
          files: [
            {
              expand: true,
              flatten: true,
              cwd: 'src/css/',
              src: '**',
              dest: 'dist/css'
            }
          ]
        },
        js: {
          files: [
            {
              expand: true,
              flatten: true,
              cwd: 'src/js/',
              src: '**',
              dest: 'dist/js/'
            }
          ]
        }
      },
      sass: {
        options: {
          sourceMap: true
        },
        dist: {
          files: {
            'dist/css/materialize.css': 'src/sass/materialize.scss'
          }
        }
      },
      assemble: {
        options: {
          helpers: 'src/js/helpers.js',
          layoutdir: 'src/layouts',
          flatten: true,
          layout: 'default.hbs',
          partials: 'src/partials/*.hbs'
        },
        page: {
          files: {
            'dist/': ['src/content/page/*.hbs']
          }
        }
      },
      cssmin: {
        options: {
          sourceMap: true,
          report: 'min'
        },
        target: {
          files: {
            'dist/css/screen.css': ['src/css/main.css', 'dist/css/materialize.css']
          }
        }
      },
      targethtml: {
        prod: {
          files: [
            {
              src: 'dist/*.html',
              dest: 'dist/'
            }
          ]
        },
        dev: {
          files: 'dist/*.html'
        }
      },
      htmlmin: {
        dist: {
          options: {
            removeComments: true,
            collapseWhitespace: true
          },
          files: {
            'dist/index.html': 'dist/index.html'
          }
        }
      },
      connect: {
        all: {
          options: {
            port: 8081,
            hostname: "0.0.0.0",
            livereload: 8082
          }
        }
      },
      watch: {
        options: {
          livereload: 8082
        },
        all: {
          files: ['src/**/*'],
          tasks: ['clean', 'coffeelint', 'coffee', 'assemble', 'targethtml:dev', 'copy:common', 'sass', 'copy:css', 'copy:js']
        }
      },
      uglify: {
        options: {
          nameCache: '.grunt-uglify-cache.json',
          mangle: {
            except: ['jQuery', 'WebFont']
          }
        },
        prod: {
          compress: true,
          mangle: true,
          nonull: true,
          files: {
            'dist/js/foot.js': ['src/js/jquery-2.1.1.min.js', 'src/js/materialize.js', 'src/js/helpers.js', 'src/js/main.js'],
            'dist/js/head.js': ['src/js/webfont.js']
          }
        }
      },
      cacheBust: {
        prod: {
          options: {
            length: 6,
            separator: '.cB',
            deleteOriginals: true,
            baseDir: './dist/',
            assets: ['css/*.css', 'js/*.js']
          },
          src: ['dist/*.html']
        }
      }
    });
    grunt.registerTask('default', ['clean', 'coffeelint', 'coffee', 'assemble', 'targethtml:dev', 'copy:common', 'sass', 'copy:css', 'copy:js']);
    grunt.registerTask('prod', ['clean', 'coffeelint', 'coffee', 'assemble', 'copy:common', 'sass', 'cssmin', 'uglify:prod', 'targethtml:prod', 'htmlmin', 'cacheBust']);
    grunt.registerTask('reloadurl', function() {
      return grunt.log.writeln('Browse: http://experiments-onesrq.c9users.io:8081/dist/');
    });
    return grunt.registerTask('devwatch', ['default', 'connect', 'reloadurl', 'watch']);
  };

}).call(this);
