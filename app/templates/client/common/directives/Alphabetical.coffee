class Alphabetical
   returnAlphabetical: ->
      require: "ngModel"
      link: (scope, element, attrs, modelCtrl) ->
         modelCtrl.$parsers.push (inputValue) ->
            return ""  unless inputValue
            transformedInput = inputValue.replace(/[^A-zçğışöüÇĞİŞÖÜ\s\.]/, "")
            unless transformedInput is inputValue
               modelCtrl.$setViewValue transformedInput
               modelCtrl.$render()
            transformedInput

Alphabetical = ->
   new Alphabetical().returnAlphabetical

angular.module("<%= _.slugify(appName) %>.directives").directive "alphabetical", Alphabetical