class PasswordCheck
   returnPwCheck: ->
      require: "ngModel"
      link: (scope, elem, attrs, ctrl) ->
         firstPassword = "#" + attrs.pwCheck
         elem.add(firstPassword).on "keyup", ->
            if elem.val().length > 0
               scope.$apply ->
                  ctrl.$setValidity "pwmatcherror", elem.val() is $(firstPassword).val()
                  if elem.val() is $(firstPassword).val()
                     ctrl.$setValidity "pwmatcherror", true
                     1
                  else
                     ctrl.$setValidity "pwmatcherror", false
                     `undefined`

            else
               ctrl.$setValidity "pwmatcherror", true
               1

         ctrl.$parsers.unshift (viewValue) ->
            if viewValue.length > 0
               scope.isPassword2Null = false
            else
               scope.isPassword2Null = true
            viewValue


pwCheck = ->
   new PasswordCheck().returnPwCheck()

angular.module("<%= _.slugify(appName) %>.directives").directive "pwCheck", pwCheck