class Reset
   constructor: (@Auth, @$rootScope) ->
      @$rootScope.alerts = []
      @$rootScope.user = @Auth.getCurrentUser()

angular.module("<%= _.slugify(appName) %>").run Reset