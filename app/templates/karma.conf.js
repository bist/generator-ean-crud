module.exports = function(config) {
   config.set({
      basePath : '../',

      files : [
         'src/client/public/vendor/jquery/jquery-1.10.2.min.js',
         'src/client/public/vendor/underscore.js/underscore-min.js',
         'src/client/public/vendor/angular/angular.js',
         'src/client/public/vendor/angular/angular-resource.min.js',
         'src/client/public/vendor/angular/angular-cookies.min.js',
         'src/client/public/vendor/angular/angular-sanitize.min.js',
         'src/client/public/vendor/angular-ui/*.js',
         'src/client/public/vendor/grid/*.js',
         'src/client/app/**/*.coffee',
         'test/lib/angular-mocks.js',
         'test/angular/data/*.js',
         'test/angular/unit/*.spec.coffee'
      ],

      frameworks : ['jasmine'],

      // possible values: 'dots', 'progress', 'junit'
      reporters : ['progress'],

      browsers : ['PhantomJS'],

      // web server port
      port : 9876,

      // enable / disable colors in the output (reporters and logs)
      colors : true,

      // level of logging
      // possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
      logLevel : config.LOG_INFO,

      // enable / disable watching file and executing tests whenever any file changes
      singleRun : true,

      // If browser does not capture in given timeout [ms], kill it
      captureTimeout : 60000

   });
};

