class Back
   returnBack: ->
      restrict: "E"
      template: "<a class=\"back-link\"><i class=\"icon-chevron-left\"></i></a>"

      scope:
         back: "@back"
         forward: "@forward"
         icons: "@icons"

      link: (scope, element, attrs) ->
         $(element[0]).on "click", ->
            history.back()
            scope.$apply()

         $(element[1]).on "click", ->
            history.forward()
            scope.$apply()

Back = ->
   new Back().returnBack()

angular.module("<%= _.slugify(appName) %>.directives").directive "back", Back