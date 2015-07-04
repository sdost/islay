path           = require('path')

escapeChar     = process.platform.match(/^win/) ? '^' : '\\'
cwd            = process.cwd().replace(/( |\(|\))/g, escapeChar + '$1')

module.exports = (grunt) ->

  # Configuration
  # =============
  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    sass:
      dist:
        files: [
          expand: true,
          cwd: 'sass',
          src: ['*.scss'],
          dest: 'assets/css',
          ext: '.css'
        ]

    coffee:
      dist:
        files: [
          expand: true,
          cwd: 'coffee',
          src: ['*.coffee'],
          dest: 'assets/js',
          ext: '.js'
        ]

    shell:
      bower:
        command: path.resolve(cwd + '/node_modules/.bin/bower --allow-root install'),
        options:
          stdout: true,
          stdin: false

    watch:
      options:
        livereload: true

      sass:
        files: ['sass/*.scss'],
        tasks: ['sass', 'notify:sass'],
        options:
          spawn: false

      coffee:
        files: ['coffee/*.coffee'],
        tasks: ['coffee', 'notify:coffee'],
        option:
          spawn: false

    notify:
      default:
        options:
          title:'Grunt'
          message: 'All tasks were processed'
      sass:
        options:
          title:'Grunt watcher'
          message: 'SASS files were processed'
      coffee:
        options:
          title:'Grunt watcher'
          message: 'Coffee files were processed'

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-compress'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-notify'
  grunt.loadNpmTasks 'grunt-shell'

  grunt.registerTask 'init', [
    'shell:bower',
    'default'
  ]

  grunt.registerTask 'default', [
    'sass'
    'coffee'
    'notify:default'
  ]
