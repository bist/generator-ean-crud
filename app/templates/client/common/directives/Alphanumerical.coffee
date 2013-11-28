class Alphanumerical
   returnAlphanumerical: ->
      require: "ngModel"
      link: (scope, element, attrs, modelCtrl) ->
         modelCtrl.$parsers.push (inputValue) ->
            return ""  unless inputValue
            transformedInput = inputValue.replace(/[^A-zçğışöüÇĞİŞÖÜ0-9\s]/, "")
            unless transformedInput is inputValue
               modelCtrl.$setViewValue transformedInput
               modelCtrl.$render()
            transformedInput

Alphanumerical = ->
   new Alphanumerical().returnAlphanumerical()

angular.module("<%= _.slugify(appName) %>.directives").directive "alphanumerical", Alphanumerical