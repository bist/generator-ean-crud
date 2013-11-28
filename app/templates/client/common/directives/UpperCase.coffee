class UpperCase
   returnUpperCase: ->
      require: "ngModel"
      link: (scope, element, attrs, modelCtrl) ->
         modelCtrl.$parsers.unshift (inputValue) ->
            return ""  unless inputValue
            transformedInput = inputValue.toUpperCase()
            unless transformedInput is inputValue
               modelCtrl.$setViewValue transformedInput
               modelCtrl.$render()
            transformedInput

UpperCase = ->
   new UpperCase().returnUpperCase()

angular.module("<%= _.slugify(appName) %>.directives").directive "upperCase", UpperCase