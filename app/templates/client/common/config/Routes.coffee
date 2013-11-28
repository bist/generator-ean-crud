class RouteProvider

   constructor: (@$routeProvider) ->

      @$routeProvider.when "/",
         controller: "HomeController"
         templateUrl: "../../modules/home/home.html"

      .when "/change-password",
         controller: "ChangePasswordController"
         templateUrl: "../../modules/authentication/change-password.html"
 
      .when "/logout",
         controller: "LogoutController"
         templateUrl: "../home.html"

      .when "/unauthorized",
         templateUrl: "../../modules/authentication/unauthorized.html"

app.config RouteProvider
    
      
