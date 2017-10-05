var LineChart = React.createClass({

  propTypes: {
    width:  React.PropTypes.number,
    height: React.PropTypes.number,
    data:   React.PropTypes.array.isRequired
  },

  getDefaultProps(){
    return {
      width:  600,
      height: 500
    }
  },
  
  render() {
    var data = this.props.data;
    var width = this.props.width;
    var height = this.props.height;

    var xScale = d3.scale.ordinal()
                   .domain(this.props.xValues)
                   .rangePoints([0, width]);

    var yScale = d3.scale.linear()
                   .range([height, 10])
                   .domain([0, this.props.yMax]);
    console.log(this.props.xValues)               
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