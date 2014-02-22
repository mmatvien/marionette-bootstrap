module.exports = (grunt) ->
  grunt.initConfig
    coffee:
       compileJoined:
         options: join: true
         files: 'javascripts/application.js': [
            'javascripts/src/config/**/*.coffee'
           ,'javascripts/src/app.coffee'
           ,'javascripts/src/entities/**/*.coffee'
           ,'javascripts/src/entities/*.coffee'
           ,'javascripts/src/views/**/*.coffee'
           ,'javascripts/src/apps/**/*.coffee'
         ]

    eco:
      app: files: 'javascripts/templates.js': ['javascripts/src/**/*.eco']

    less:
      app:
        options: yuicompress: true
        files: 'stylesheets/style.css' : 'stylesheets/src/style.less'

    watch:
      coffee:
        files: ['javascripts/src/*.coffee','javascripts/src/**/*.coffee']
        tasks: ['coffee']
      eco:
        files: 'javascripts/src/**/*.eco'
        tasks: ['eco']
      less:
        files: 'stylesheets/src/*.less'
        tasks: ['less']

  grunt.loadNpmTasks 'grunt-eco'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-less'

  grunt.registerTask 'default', ['coffee','eco','less']
