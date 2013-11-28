class DateInput
   returnDateInput: (dateFilter) ->
      require: "ngModel"
      link: (scope, elm, attrs, ctrl) ->
         ctrl.$formatters.unshift (modelValue) ->
            ctrl.$setValidity "minDate", true
            return `undefined`  unless modelValue
            dateFilter modelValue, "dd.MM.yyyy"

         ctrl.$parsers.push (inputValue) ->
            ctrl.$setValidity "minDate", true
            if inputValue instanceof Date
               ctrl.$setValidity "minDate", false  if inputValue < Date.parse("01.01.1900")
               Date.parse inputValue


DateInput = (dateFilter) ->
   new DateInput().returnDateInput(dateFilter)

angular.module("<%= _.slugify(appName) %>.directives").directive "dateInput", DateInput