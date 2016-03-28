class MeasurementLineChart
  constructor: () ->
    @margin = { top: 20, right: 80, bottom: 30, left: 50 }
    @height = 500 - @margin.top - @margin.bottom
    @width = 960 - @margin.left - @margin.right

    @parseDate = d3.time.format('%Y/%m/%d %H:%M:%S').parse

    @x = d3.time.scale().range([0, @width])
    @y = d3.scale.linear().range([@height, 0])

    @color = d3.scale.category10()

    @xAxis = d3.svg.axis().scale(@x).orient('bottom')
    @yAxis = d3.svg.axis().scale(@y).orient('left')

    # @line = d3.svg.line().interpolate('basis').x((d) -> x(d.created_at)).y((d) -> y(d.temperature))

    @svg = d3.select('#d3-canvas').append('svg')
      .attr('width', @width + @margin.left + @margin.right)
      .attr('height', @height + @margin.top + @margin.bottom)
      .append('g')
      .attr('transform', 'translate(' + @margin.left + ',' + @margin.top + ')')

  initChart: () ->
    url = $('#d3-canvas').data('url')
    $.ajax(url).done(@renderData).fail(@handleError)

  renderData: (data) =>
    console.log(data);

    @svg.append('g')
      .attr('class', 'x axis')
      .attr('transform', 'translate(0,' + @height + ')')
      .call(@xAxis);

    @svg.append('g')
      .attr('class', 'y axis')
      .call(@yAxis)
      .append('text')
      .attr('transform', 'rotate(-90)')
      .attr('y', 6)
      .attr('dy', '.71em')
      .style('text-anchor', 'end')

  handleError: (data) =>
    alert('Error')

window.MeasurementLineChart or= MeasurementLineChart
