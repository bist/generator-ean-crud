class PasswordValidate
   returnPwValidate: ->
      require: "ngModel"
      link: (scope, elm, attrs, ctrl) ->
         ctrl.$parsers.unshift (viewValue) ->
            scope.pwdValidLength = ((if viewValue and viewValue.length >= 8 and viewValue.length <= 16 then "valid" else `undefined`))
            scope.pwdHasLetter = (if (viewValue and /[A-z]/.test(viewValue)) then "valid" else `undefined`)
            scope.pwdHasNumber = (if (viewValue and /\d/.test(viewValue)) then "valid" else `undefined`)
            if viewValue.length > 0
               scope.isPassword1Null = false
               if scope.pwdValidLength and scope.pwdHasLetter and scope.pwdHasNumber
                  ctrl.$setValidity "pwruleerror", true
                  viewValue
               else
                  ctrl.$setValidity "pwruleerror", false
                  `undefined`
            else
               scope.isPassword1Null = true
               ctrl.$setValidity "pwruleerror", true
               viewValue


pwValidate = ->
   new PasswordValidate().returnPwValidate()

angular.module("<%= _.slugify(appName) %>.directives").directive "passwordValidate", pwValidate

