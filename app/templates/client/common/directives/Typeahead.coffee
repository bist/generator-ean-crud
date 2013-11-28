class Typeahead
   returnTypeahead: ($parse)->
      restrict: "E"
      require: "ngModel"
      replace: true
      template: "<span class='typeahead-wrapper' id='search-box-wrapper'>" +
      "<input type='search' bs-typeahead='data' ng-model='ngModel' class='typeahead' placeholder='{{placeholder}}' id='{{searchBoxId}}' autofocus>" +
      "<i id='clear-search' class='icon-remove-sign typeahead-clear' ng-click='ngModel = \"\"'></i>" +
      "</span>"
      scope:
         data: "="
         ngModel: "="
         placeholder: "@"
         searchBoxId: "@"

Typeahead = ($parse)->
   new Typeahead().returnTypeahead($parse)

angular.module("<%= _.slugify(appName) %>.directives").directive "typeahead", Typeahead