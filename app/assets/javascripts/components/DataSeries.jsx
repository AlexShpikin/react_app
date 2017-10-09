const DataSeries = React.createClass({

  propTypes: {
    colors:             React.PropTypes.func,
    data:               React.PropTypes.array,
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
  componentWillMount: function(){
  },
  render() {
    let { data, colors, xScale, yScale, interpolationType } = this.props;

    var line = d3.svg.line()
      .interpolate(interpolationType)
      .x((d) => { return xScale(d.x); })
      .y((d) => { return yScale(d.y); });

    var x=d3.scale.linear()
            .domain([0,300])
            .range([0, 4]);

    
    var lines = data.map((series, id) => {
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
      </g>
    );
  }

});