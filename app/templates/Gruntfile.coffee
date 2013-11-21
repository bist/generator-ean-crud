module.exports = (grunt) ->

   # -- Constants --
   TARGET_DIR = 'target'
   MODULES_BIN_DIR = 'node_modules/.bin'

   grunt.initConfig
      clean: [TARGET_DIR]

      coffee:
         options:
            sourceMap: true
            bare: true

         compile:
            expand: true
            src: ['app.coffee', 'src/client/**/*.coffee', 'src/server/**/*.coffee']
            dest: TARGET_DIR
            ext: '.js'

      watch:
         coffee:
            files: ['app.coffee', 'src/client/**/*.coffee', 'src/server/**/*.coffee']
            tasks: ['coffee', 'shell:copyConfiguration', 'shell:copyClient', 'shell:unit', 'shell:angular_unit', 'shell:integration']
         js_html:
            files: ['src/client/**/*.html', 'src/client/**/*.js', 'src/client/**/*.css']
            tasks: ['shell:copyClient', 'shell:angular_unit']
         test:
            files: ['test/**/*.coffee']
            tasks: ['shell:unit', 'shell:angular_unit', 'shell:integration']

      jshint: {
      	 all: ['target/**/*.js']
      }

      uglify: {
          my_target: {
            files: {
               'target/mis.min.js': ['target/**/*.js']
            }
          }
      }

      shell:
         options:
            stdout: true

         server:
            command: "coffee app.coffee"

         unit:
            command: "#{MODULES_BIN_DIR}/parallel-mocha test/unit"

         integration:
            command: "#{MODULES_BIN_DIR}/parallel-mocha test/integration"

         angular_unit:
            command: "#{MODULES_BIN_DIR}/karma start test/karma.conf.js"

         test:
            command: "#{MODULES_BIN_DIR}/parallel-mocha --reporter teamcity test/unit test/integration"

         copyConfiguration:
            command: "cp config.yaml packages.json #{TARGET_DIR}"

         copyClient:
            command: "cp -R src/client #{TARGET_DIR}/src"


   grunt.loadNpmTasks 'grunt-contrib-watch'
   grunt.loadNpmTasks 'grunt-contrib-clean'
   grunt.loadNpmTasks 'grunt-contrib-coffee'

   grunt.loadNpmTasks 'grunt-shell'
   grunt.loadNpmTasks 'grunt-contrib-jshint'
   grunt.loadNpmTasks 'grunt-contrib-uglify'


   grunt.registerTask 'build', ['clean', 'coffee', 'shell:copyConfiguration', 'shell:copyClient']
   grunt.registerTask 'all', ['build', 'shell:unit', 'shell:angular_unit', 'shell:integration']
   grunt.registerTask 'all-ci', ['build', 'shell:test']
   grunt.registerTask 'default', ['build', 'shell:unit', 'shell:angular_unit', 'shell:integration', 'watch']
   grunt.registerTask 'coverage', ['uglify','jshint']