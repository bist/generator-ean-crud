class AuthorizationInterceptor 
   constructor: (@$httpProvider) ->
      interceptor = ($location, @$q, @$cookieStore) ->
         success = (response) ->
            response
         error = (response) ->
            if response.status is 401
               @$cookieStore.put "user", {}
               window.location = "login.html"
               @$q.reject response
            else
               @$q.reject response
         (promise) ->
            promise.then success, error
      @$httpProvider.responseInterceptors.push interceptor

angular.module("<%= _.slugify(appName) %>").config AuthorizationInterceptor