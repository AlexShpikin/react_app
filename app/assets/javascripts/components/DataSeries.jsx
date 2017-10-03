const DataSeries = React.createClass({

  propTypes: {
    colors:             React.PropTypes.func,
    data:               React.PropTypes.object,
    interpolationType:  React.PropTypes.string,
    xScale:             React.PropTypes.func,
    yScale:             React.PropTypes.func
  },

  getDefaultProps() {
    return {
      data:               [],
      interpolationType:  'cardinal',
      colors:             d3.scale.category10()
    };
  },
  render() {
    let { data, colors, xScale, yScale, interpolationType } = this.props;

    let line = d3.svg.line()
      .interpolate(interpolationType)
      .x((d) => { return xScale(d.x); })
      .y((d) => { return yScale(d.y); });
    var x=d3.scale.linear()
            .domain([0,300])
            .range([0, 4]);

    var axis = d3.svg.axis() 
            .scale(x) // функция интерполяции
            .orient('bottom') // горизонтальная
            .ticks(5); // сколько делений на оси  
    let lines = data.points.map((series, id) => {
      return (
        <Line
          path={line(series)}
          stroke={colors(id)}
          key={id}
          />
      );
    });

    return (
      <g>
        <g>{lines}</g>
        <g>{axis}</g>
      </g>
    );
  }

});