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
    
    var data = this.props.data,
        width = this.props.width,
        height = this.props.height,

        xScale = d3.scale.ordinal()
                   .domain(this.props.xValues)
                   .rangePoints([0, width]),

        yScale = d3.scale.linear()
                   .range([height, 10])
                   .domain([0, this.props.yMax]);               
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