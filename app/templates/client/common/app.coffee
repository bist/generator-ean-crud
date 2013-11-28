angular.module "<%= _.slugify(appName) %>.directives", []
angular.module "<%= _.slugify(appName) %>.filters", []

app = angular.module "ubys", ["angri", "ui.bootstrap", "ui.utils", "ngResource", "$strap.directives", "ngCookies", "ngSanitize", "<%= _.slugify(appName) %>.directives", "<%= _.slugify(appName) %>.filters"]

loginModule = angular.module "login", ['ngCookies', "ui.bootstrap", "<%= _.slugify(appName) %>.directives", "$strap.directives"]