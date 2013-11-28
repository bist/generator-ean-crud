class BarChart
   returnBarChart: ->
      restrict: "E"
      replace: true
      templateUrl: "../common/graph-container.html"
      scope:
         chartId: "@"
         label: "@"
         chartData: "="
         x: "@"
         y: "@"
         xTickFormat: "@"
         yTickFormat: "@"
         nullReplacement: "@"
      link: (scope, elm, attrs, ctrl) ->
         drawChart = ->
            return if !scope.chartData

            data = [
               key: "bar-chart-#{scope.chartId}"
               values: scope.chartData
            ]

            nv.addGraph ->
               chart = nv.models.discreteBarChart()
                  .x((d) ->
                     value = d[scope.x]

                     return value || scope.nullReplacement
                  ).y((d) ->
                     d[scope.y]
               ).staggerLabels(false)
                .showValues(true)
                .showTicks(false)
                .showYAxis(false)

               if scope.xTickFormat
                  chart.xAxis.tickFormat(d3.format(scope.xTickFormat))

               if scope.yTickFormat
                  chart.yAxis.tickFormat(d3.format(scope.yTickFormat))

               d3.select("##{scope.chartId} svg").datum(data).transition().duration(150).call chart

               nv.utils.windowResize chart.update

               chart

         scope.$watch('chartData', drawChart)



BarChart = ->
   new BarChart().returnBarChart()

angular.module("<%= _.slugify(appName) %>.directives").directive "barChart", BarChart