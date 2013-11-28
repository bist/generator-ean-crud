class OnlyNumber
   returnOnlyNumber: ->
      require: "ngModel"
      link: (scope, element, attrs, modelCtrl) ->
         modelCtrl.$parsers.push (inputValue) ->
            return ""  unless inputValue
            transformedInput = inputValue.replace(/[^0-9]+/g, "")
            unless transformedInput is inputValue
               modelCtrl.$setViewValue transformedInput
               modelCtrl.$render()
            transformedInput

OnlyNumber = ->
   new OnlyNumber().returnOnlyNumber()

angular.module("<%= _.slugify(appName) %>.directives").directive "onlyNumber", OnlyNumber