var Axis = React.createClass({
	componentDidMount: function(){
		this.renderAxis();
	},
	componentDidUpdate() {
    	this.renderAxis()	
  	},
  	renderAxis: function(){
  		var node = this.refs.axis;
  		var axis = d3.svg.axis().orient(this.props.orient).ticks(5).scale(this.props.scale);
    	d3.select(node).call(axis).append("text").style("text-anchor", "start").text(this.props.text);
  	},
	render: function(){
		return <g className="axis" ref="axis" transform={this.props.translate}></g>
	}
});