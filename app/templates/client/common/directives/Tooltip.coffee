class Tooltip
   returnBistTooltip: ->
      restrict: "A"
      link: (scope, element, attrs) ->
         $(element).attr("title", attrs.Tooltip).tooltip
            placement: attrs.bistPlacement || "left"

Tooltip = ->
   new Tooltip().returnBistTooltip()

angular.module("<%= _.slugify(appName) %>.directives").directive "tooltip", Tooltip