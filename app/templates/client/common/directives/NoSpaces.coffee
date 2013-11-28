class NoSpaces
   returnNoSpaces: ->
      require: "ngModel"
      link: (scope, element, attrs, modelCtrl) ->
         modelCtrl.$parsers.push (inputValue) ->
            return ""  unless inputValue
            transformedInput = inputValue.replace(/[\s]/, "")
            unless transformedInput is inputValue
               modelCtrl.$setViewValue transformedInput
               modelCtrl.$render()
            transformedInput

noSpaces = ->
   new NoSpaces().returnNoSpaces

angular.module("<%= _.slugify(appName) %>.directives").directive "noSpaces", noSpaces