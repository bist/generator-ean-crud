class SqlDate
   returnSqlDate: (dateFilter) ->
      restrict: "A"
      require: "ngModel"
      link: (scope, elm, attrs, ctrl) ->
         ctrl.$formatters.unshift (modelValue) ->
            return `undefined`  unless modelValue
            dateFilter modelValue, "dd.MM.yyyy"

         ctrl.$parsers.push (inputValue) ->
            return if inputValue is undefined

            y = inputValue.getFullYear()
            M = if inputValue.getMonth() < 9 then "0" + (inputValue.getMonth() + 1) else (inputValue.getMonth() + 1)
            d = if inputValue.getUTCDate() < 10 then "0" + inputValue.getUTCDate() else inputValue.getUTCDate()
            h = if inputValue.getHours() < 10 then "0" + inputValue.getHours() else inputValue.getHours()
            m = if inputValue.getMinutes() < 10 then "0" + inputValue.getMinutes() else inputValue.getMinutes()
            s = if inputValue.getSeconds() < 10 then "0" + inputValue.getSeconds() else inputValue.getSeconds()
            parsedDate = y + "" + M + "" + d + "" + h + "" + m + "" + s

SqlDate = (dateFilter) ->
   new SqlDate().returnSqlDate (dateFilter)

angular.module("<%= _.slugify(appName) %>.directives").directive "sqlDate", SqlDate