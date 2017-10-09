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
    var chart = {};
    var data = this.props.data,
        width = this.props.width,
        height = this.props.height,

        xScale = d3.scale.ordinal()
                   .domain(this.props.xValues)
                   .rangePoints([0, width]),

        yScale = d3.scale.linear()
                   .range([height, 10])
                   .domain([0, this.props.yMax]);

        var xSettings = {
          translate: 'translate(40,' + (height - 1) + ')',
          scale: xScale,
          orient: 'bottom',
          text: '№ Competition'
        };
        var ySettings = {
          translate: 'translate(40, 0)',
          scale: yScale,
          orient: 'left',
          text: 'Score'
        };           
    return (
      <svg width="650" height="330">
          <DataSeries
            xScale={xScale}
            yScale={yScale}
            data={data}
            width={width}
            height={height}
            />
            <Axis {...xSettings}/>
            <Axis {...ySettings}/>
      </svg>
    );
  }

});