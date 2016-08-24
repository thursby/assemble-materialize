module.exports = (grunt) ->
  
  # Define all JavaScript Resources used in the project
  js_foot = [
    'bower_components/jquery/dist/jquery.js'
    'bower_components/materialize/dist/js/materialize.js'
    'bower_components/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js'
    'bower_components/fullpage.js/dist/jquery.fullpage.js'
    'src/js/helpers.js'
    'src/js/main.js'
  ]
  
  js_head = [
    'src/js/webfont.js'
  ]
  
  # Use load-grunt-tasks to source our loadNpmTasks from package.json
  require('load-grunt-tasks') grunt
  
  grunt.initConfig
    pkg: grunt.file.readJSON './package.json'
    
    # delete the dist directory, the whole thang should build from src
    clean:
      'dist'
    
    # Check the CoffeeScript for errors (lint)
    coffeelint:
      app: [
        'src/**/*.coffee'
        'Gruntfile.coffee'
      ]
    
    # Compile the CoffeeScript into JavaScript and flatten subdirectories
    coffee:
      grunt:
        src: 'Gruntfile.coffee'
        dest: 'Gruntfile.js'
      app:
        expand: true
        flatten: true
        cwd: 'src/'
        src: ['js/**/*.coffee']
        dest: 'src/js'
        ext: '.js'

    copy:
      common:
        files: [
          # Copy public_html skeleton files
          expand: true
          cwd: 'src/public_html'
          src: '**'
          dest: 'dist/'
        ,
          # Copy fonts
          expand: true
          cwd: 'src/fonts'
          src: '**'
          dest: 'dist/fonts'
        ,
          # Copy Images
          expand: true
          cwd: 'src/img'
          src: '**'
          dest: 'dist/img'
        ,
          # Copy CSS Images
          expand: true
          cwd: 'src/css/img'
          src: '**'
          dest: 'dist/css/img'
        ]
      css:
        files: [
        # CSS
          expand: true
          flatten: true
          cwd: 'src/css/'
          src: '**'
          dest: 'dist/css'
        ,
          # Copy CSS
          expand: true
          cwd: 'bower_components/jquery.mb.ytplayer/dist/css/'
          src: 'jquery.mb.YTPlayer.min.css'
          dest: 'dist/css/'
        ,
          # Copy CSS
          expand: true
          cwd: 'bower_components/fullpage.js/dist/'
          src: 'jquery.fullpage.css'
          dest: 'dist/css/'
        ]
      js:
        files: [
        # Copy Header JavaScript files
          expand: true
          flatten: true
          src: js_head
          dest: 'dist/js/'
        ,
        # Copy Footer JavaScript files
          expand: true
          flatten: true
          src: js_foot
          dest: 'dist/js/'
        ]
    sass:
      options:
        sourceMap: true
      dist:
        files:
          'dist/css/materialize.css':
            'bower_components/materialize/sass/materialize.scss'

    # Run Assemble.io to compile the Handlebars templates
    assemble:
      options:
        helpers: 'src/js/helpers.js'
        layoutdir: 'src/layouts'
        flatten: true
        layout: 'default.hbs'
        partials: 'src/partials/*.hbs'
      page:
        files:
          'dist/': [
            'src/content/page/*.hbs',
          ]
    
    # Use cssmin to minify and bundle the CSS
    cssmin:
      options:
        sourceMap: true
        report: 'min'
      ,
      target:
        files:
          'dist/css/screen.css': [
            'dist/css/materialize.css'
            'dist/css/jquery.mb.YTPlayer.min.css'
            'src/css/main.css'
          ]

    targethtml:
      # These look the same, but act differently for each target
      prod:
        files: [
          src: 'dist/*.html'
          dest: 'dist/'
        ]
      ,
      dev:
        files:
          'dist/*.html'

    htmlmin:
      dist:
        options:
          removeComments: true,
          collapseWhitespace: true
        files:
          'dist/index.html': 'dist/index.html'

    connect:
      all:
        options:
          port: 8081
          hostname: "0.0.0.0"
          livereload: 8082

    # Configure the files to watch for changes and the commands to execute
    watch:
      options:
        livereload: 8082
      all:
        files: [
          'src/**/*'
        ]
        tasks: [
          'clean'
          'coffeelint'
          'coffee'
          'assemble'
          'targethtml:dev'
          'copy:common'
          'sass'
          'copy:css'
          'copy:js'
        ]

    # Production Only tasks
    
    uglify:
      options:
        nameCache: '.grunt-uglify-cache.json',
        mangle:
          except: ['jQuery', 'WebFont']
      ,
      prod:
        compress: true
        mangle: true
        nonull: true
        files:
          'dist/js/foot.js': js_foot
          'dist/js/head.js': js_head

    cacheBust:
      prod:
        options:
          length: 6
          separator: '.cB'
          deleteOriginals: true
          baseDir: './dist/'
          assets: [
            'css/*.css'
            'js/*.js'
          ]
        src: ['dist/*.html']

    
  # Default task.
  grunt.registerTask 'default', [
    'clean'
    'coffeelint'
    'coffee'
    'assemble'
    'targethtml:dev'
    'copy:common'
    'sass'
    'copy:css'
    'copy:js'
  ]
  grunt.registerTask 'prod', [
    'clean'
    'coffeelint'
    'coffee'
    'assemble'
    'copy:common'
    'sass'
    'cssmin'
    'uglify:prod'
    'targethtml:prod'
    'htmlmin'
    'cacheBust'
  ]
  
  grunt.registerTask 'reloadurl', ->
    grunt.log.writeln 'Browse: http://experiments-onesrq.c9users.io:8081/dist/'

  
  grunt.registerTask 'devwatch', [
    'default'
    'connect'
    'reloadurl'
    'watch'
  ]