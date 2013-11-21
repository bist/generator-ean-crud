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

EanCrudGenerator.prototype.app = function app() {
  this.mkdir('src/client/modules');
  this.mkdir('src/client/modules/config');
  this.mkdir('src/client/public');
  this.mkdir('src/server/api');
  this.mkdir('src/server/routes');

  this.mkdir('test/server/integration');
  this.mkdir('test/server/unit');
  this.mkdir('test/client/integration');
  this.mkdir('test/client/unit');

  this.copy('_package.json', 'package.json');
  this.copy('Gruntfile.coffee', 'Gruntfile.coffee');
  this.copy('app.coffee','app.coffee');
  this.copy('mocha.opts','test/mocha.opts');
  this.copy('karma.conf.js','test/client/karma.conf.js');
  this.copy('server/routes/client.coffee','src/server/routes/client.coffee');

};

EanCrudGenerator.prototype.projectfiles = function projectfiles() {
  this.copy('editorconfig', '.editorconfig');
  this.copy('jshintrc', '.jshintrc');
};
