'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator'); 


var EanCrudGenerator = module.exports = function EanCrudGenerator(args, options, config) {
   yeoman.generators.Base.apply(this, arguments);

   this.on('end', function () {
      this.installDependencies({ skipInstall: options['skip-install'] });
   });

   this.pkg = JSON.parse(this.readFileAsString(path.join(__dirname, '../package.json')));
};

util.inherits(EanCrudGenerator, yeoman.generators.Base);

EanCrudGenerator.prototype.askFor = function askFor() {
   var cb = this.async();

   // have Yeoman greet the user.
   console.log(this.yeoman);

   var prompts = [{ 
      name: 'appName',
      message: 'What do you want to call this app?'
   }];

   this.prompt(prompts, function (props) {
      this.appName = props.appName;

      cb();
   }.bind(this));
};

EanCrudGenerator.prototype.createFolders = function createFolders() {
   this.mkdir('src/client/modules');
   this.mkdir('src/client/common');
   this.mkdir('src/client/common/config');
   this.mkdir('src/client/common/directives');
   this.mkdir('src/client/common/filters');
   this.mkdir('src/client/common/interceptors');
   this.mkdir('src/client/public');
   this.mkdir('src/server/api');
   this.mkdir('src/server/routes');

   this.mkdir('test/server/integration');
   this.mkdir('test/server/unit');
   this.mkdir('test/client/integration');
   this.mkdir('test/client/unit');
};

EanCrudGenerator.prototype.templates = function templates() {
     
   this.template('app.coffee','app.coffee');
   this.template('Gruntfile.coffee', 'Gruntfile.coffee');

   // directives
   var dirSrc = 'client/common/directives/';
   var dirDst = 'src/client/common/directives/';
   this.template(dirSrc+'Alphabetical.coffee',dirDst+'Alphabetical.coffee');
   this.template(dirSrc+'Alphanumerical.coffee',dirDst+'Alphanumerical.coffee');
   this.template(dirSrc+'Back.coffee',dirDst+'Back.coffee');
   this.template(dirSrc+'BarChart.coffee',dirDst+'BarChart.coffee');
   this.template(dirSrc+'DateInput.coffee',dirDst+'DateInput.coffee');
   this.template(dirSrc+'GroupedBarChart.coffee',dirDst+'GroupedBarChart.coffee');
   this.template(dirSrc+'MaxLength.coffee',dirDst+'MaxLength.coffee');
   this.template(dirSrc+'NoSpaces.coffee',dirDst+'NoSpaces.coffee');
   this.template(dirSrc+'Notification.coffee',dirDst+'Notification.coffee');
   this.template(dirSrc+'OnlyNumber.coffee',dirDst+'OnlyNumber.coffee');
   this.template(dirSrc+'PasswordCheck.coffee',dirDst+'PasswordCheck.coffee');
   this.template(dirSrc+'SqlDate.coffee',dirDst+'SqlDate.coffee');
   this.template(dirSrc+'Tooltip.coffee',dirDst+'Tooltip.coffee');
   this.template(dirSrc+'Typeahead.coffee',dirDst+'Typeahead.coffee');
   this.template(dirSrc+'UpperCase.coffee',dirDst+'UpperCase.coffee');

   // filters
   dirSrc = 'client/common/filters/';
   dirDst = 'src/client/common/filters/';
   this.template(dirSrc+'PhoneNumber.coffee',dirDst+'PhoneNumber.coffee');
   this.template(dirSrc+'Truncate.coffee',dirDst+'Truncate.coffee');


   // interceptors
   dirSrc = 'client/common/interceptors/';
   dirDst = 'src/client/common/interceptors/';
   this.template(dirSrc+'AuthorizationInterceptor.coffee',dirDst+'AuthorizationInterceptor.coffee');
   this.template(dirSrc+'Reset.coffee',dirDst+'Reset.coffee');
   this.template(dirSrc+'SpinnerInterceptor.coffee',dirDst+'SpinnerInterceptor.coffee');
   this.template(dirSrc+'SpinnerInterceptorPromise.coffee',dirDst+'SpinnerInterceptorPromise.coffee');

   //common
   dirSrc = 'client/common/';
   dirDst = 'src/client/common/';
   this.template(dirSrc+'alert.html',dirDst+'alert.html');
   this.template(dirSrc+'app.coffee',dirDst+'app.coffee');
   this.template(dirSrc+'graph-container.html',dirDst+'graph-container.html');
   this.template(dirSrc+'message.html',dirDst+'message.html');
   this.template(dirSrc+'messageBoxes.coffee',dirDst+'messageBoxes.coffee');

};

EanCrudGenerator.prototype.projectfiles = function projectfiles() {
   this.copy('editorconfig', '.editorconfig');
   this.copy('jshintrc', '.jshintrc');

   this.copy('config.yaml','config.yaml');
   this.copy('_package.json', 'package.json');
   this.copy('mocha.opts','test/mocha.opts');
   this.copy('karma.conf.js','test/client/karma.conf.js');
   this.copy('server/routes/client.coffee','src/server/routes/client.coffee');
};
