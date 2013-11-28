class SpinnerInterceptor
   constructor: (@$httpProvider) ->
      @$httpProvider.responseInterceptors.push "spinnerInterceptor"
      spinnerFunction = (data, headersGetter) ->
         $("#spinner").show()
         data

      @$httpProvider.defaults.transformRequest.push spinnerFunction

angular.module("<%= _.slugify(appName) %>").config SpinnerInterceptor