class SpinnerInterceptorPromise 
   returnPromise:($q, $window)  ->
      (promise) ->
         promise.then ((response) ->
            $("#spinner").hide()
            response
         ), (response) ->
            $("#spinner").hide()
            $q.reject response

spinnerInterceptorFunction = ($q, $window) -> 
   new SpinnerInterceptorPromise().returnPromise($q, $window) 

angular.module("<%= _.slugify(appName) %>").factory "spinnerInterceptor", spinnerInterceptorFunction