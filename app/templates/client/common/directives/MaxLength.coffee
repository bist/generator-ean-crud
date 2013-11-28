class MaxLength
   returnMaxLength: ->
      require: "ngModel"
      link: (scope, element, attrs, modelCtrl) ->
         maxLength = attrs.MaxLength
         modelCtrl.$parsers.push (inputValue) ->
            transformedInput = ""
            return ""  unless inputValue
            if inputValue.length > maxLength
               transformedInput = inputValue.substring(0, maxLength)
            else
            return inputValue
            unless transformedInput is inputValue
               modelCtrl.$setViewValue transformedInput
               modelCtrl.$render()
            transformedInput


MaxLength = ->
   new MaxLength().returnMaxLength()

angular.module("<%= _.slugify(appName) %>.directives").directive "maxLength", MaxLength