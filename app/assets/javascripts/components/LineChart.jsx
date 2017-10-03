var LineChart = React.createClass({

  propTypes: {
    width:  React.PropTypes.number,
    height: React.PropTypes.number,
    data:   React.PropTypes.object.isRequired
  },

  getDefaultProps(){
    return {
      width:  600,
      height: 300
    }
  },
  
  render() {
    var data = this.props.data;
    var width = this.props.width;
    var height = this.props.height;

    var xScale = d3.scale.ordinal()
                   .domain(data.xValues)
                   .rangePoints([0, width]);

    var yScale = d3.scale.linear()
                   .range([height, 10])
                   .domain([data.yMin, data.yMax]);

    return (
      <svg width={width} height={height}>
          <DataSeries
            xScale={xScale}
            yScale={yScale}
            data={data}
            width={width}
            height={height}
            />
      </svg>
    );
  }

});