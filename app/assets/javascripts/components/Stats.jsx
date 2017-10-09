var Stats = React.createClass({
	propTypes: {
	    data: React.PropTypes.array,
	    active: React.PropTypes.number,
	    points: React.PropTypes.array
	},
	getInitialState: function(){
		return {
			data: this.props.data,
			active: 0,
			paramField: 'competitions_count'
		}
	},
	getDefautProps: function(){
		return {
			data: []
		}
	},
	loadData: function(index){
		var self = this;
		if(index > 0){
			$.ajax({
				url: '/home/load',
				method: 'GET',
				data: 'index='+index,
				dataType: 'JSON',
				success: function(response){
					self.setState({data:response, active: index, paramField: 'sportsmans_count'})
				}
			})
		}else{
			this.setState({data:this.props.data, active: index, paramField: 'competitions_count'})
		}
	},
	summElements: function(arr){
		return arr.reduce(function(sum, current) { return sum + current}, 0)
	},
	componentWillMount: function(){
	},
	render: function(){
		var secondGraph;
		if(this.state.active > 0){
			var dataMiddle = this.state.data.map(function(value, index){return {'x':index, 'y': this.summElements(value.results)/value.results.length}}, this),
				dataMax = this.state.data.map(function(value, index){return	{'x':index, 'y':Math.max(...value.results)}}),
	        	xValues = this.state.data.map(function(value, index){return index}),
	        	yMax = Math.max(...this.state.data.map(function(index){return Math.max(...index.results)})),
	        	points = [dataMax, dataMiddle];
			secondGraph = <LineChart data={points} yMax={yMax} xValues={xValues} width={600} height={300}/>
		}else{
			secondGraph = <DonutChart  data={this.state.data}/>
		}
		return  (
			<div className="container">
				<div className="tabs">
					<Tabs data={this.props.list} action={this.loadData}/>
				</div>
				<div className="content">
					<BarChart data={this.state.data} param={this.state.paramField}/>
					{secondGraph}
				</div>
			</div>		
		)
	}
});