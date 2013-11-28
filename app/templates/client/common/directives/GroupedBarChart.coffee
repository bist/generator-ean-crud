class GroupedBarChart
   returnGroupedBarChart: ->
      restrict: "E"
      replace: true
      templateUrl: "common/graph-container.html"
      scope:
         chartId: "@"
         label: "@"
         chartData: "="
         groupMappings: "="
         xTickFormat: "@"
         yTickFormat: "@"
      link: (scope, elm, attrs, ctrl) ->
         drawChart = ->
            return if !scope.chartData

            nv.addGraph ->
               chart = nv.models.multiBarChart()
                  .staggerLabels(false)
                  .reduceXTicks(false)
                  .showControls(false)
                  .showYAxis(false)
                  .showTicks(false)

               if scope.xTickFormat
                  chart.xAxis.tickFormat(d3.format(scope.xTickFormat))

               if scope.yTickFormat
                  chart.yAxis.tickFormat(d3.format(scope.yTickFormat))

               for group in scope.chartData
                  group.key = group.key

               d3.select("##{scope.chartId} svg")
                  .datum(scope.chartData)
                  .transition().duration(150).call(chart)

               nv.utils.windowResize(chart.update)
               chart

         scope.$watch('chartData', drawChart)

GroupedBarChart = ->
   new GroupedBarChart().returnGroupedBarChart()

angular.module("<%= _.slugify(appName) %>.directives").directive "groupedBarChart", GroupedBarChart