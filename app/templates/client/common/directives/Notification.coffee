class Notification
   returnBistNotification: ($timeout) ->
      restrict: "E"
      replace: true
      require: "ngModel"
      scope:
         ngModel: "="
         timeout: "@"
         model: "=ngModel"
      template: "<div id='{{ngModel.id}}' class=\"alert fade\" bs-alert=\"ngModel\"></div>"
      link: (scope, element, attrs, ngModel) ->
         hide = (timeoutValue) ->
            return  unless typeof timeoutValue is "number"
            $timeout (->
               element.empty()
               element.hide()
            ), timeoutValue

         scope.$watch "model", (modelValue) ->
            hide modelValue.timeout

         attrs.$observe "timeout", hide

Notification = ($timeout) ->
   new Notification().returnBistNotification($timeout)

angular.module("<%= _.slugify(appName) %>.directives").directive "notification", Notification          