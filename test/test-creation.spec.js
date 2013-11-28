/*global describe, beforeEach, it*/
'use strict';

var path    = require('path');
var helpers = require('yeoman-generator').test;


describe('ean-crud generator', function () {
    beforeEach(function (done) {
        helpers.testDirectory(path.join(__dirname, 'temp'), function (err) {
            if (err) {
                return done(err);
            }

            this.app = helpers.createGenerator('ean-crud:app', [
                '../../app'
            ]);
            done();
        }.bind(this));
    });

    it('creates expected files', function (done) {
        var expected = [
            // add files you expect to exist here.
            '.jshintrc',
            '.editorconfig',
            'Gruntfile.coffee',
            'config.yaml',
            'app.coffee',
            'src/client/modules',
            'src/client/common/config',
            'src/client/common/directives',
            'src/client/common/filters',
            'src/client/common/interceptors',
            'src/client/public',
            'src/server/api',
            'src/server/routes',
            'test/mocha.opts',
            'test/client/karma.conf.js',
            'src/server/routes/client.coffee',
            'test/server/integration',
            'test/server/unit',
            'test/client/integration',
            'test/client/unit',
            'src/client/common/directives/Alphabetical.coffee',
            'src/client/common/directives/Alphanumerical.coffee',
            'src/client/common/directives/Back.coffee',
            'src/client/common/directives/BarChart.coffee',
            'src/client/common/directives/DateInput.coffee',
            'src/client/common/directives/GroupedBarChart.coffee',
            'src/client/common/directives/MaxLength.coffee',
            'src/client/common/directives/NoSpaces.coffee',
            'src/client/common/directives/Notification.coffee',
            'src/client/common/directives/OnlyNumber.coffee',
            'src/client/common/directives/PasswordCheck.coffee',
            'src/client/common/directives/SqlDate.coffee',
            'src/client/common/directives/Tooltip.coffee',
            'src/client/common/directives/Typeahead.coffee',
            'src/client/common/directives/UpperCase.coffee',
            'src/client/common/filters/PhoneNumber.coffee',
            'src/client/common/filters/Truncate.coffee',
            'src/client/common/interceptors/AuthorizationInterceptor.coffee',
            'src/client/common/interceptors/Reset.coffee',
            'src/client/common/interceptors/SpinnerInterceptor.coffee',
            'src/client/common/interceptors/SpinnerInterceptorPromise.coffee',
            'src/client/common/alert.html',
            'src/client/common/app.coffee',
            'src/client/common/graph-container.html',
            'src/client/common/message.html',
            'src/client/common/messageBoxes.coffee'

        ];

        helpers.mockPrompt(this.app, {
            'appName': "appName"
        });
        this.app.options['skip-install'] = true;
        this.app.run({}, function () {
            helpers.assertFiles(expected);
            done();
        });
    });
});
