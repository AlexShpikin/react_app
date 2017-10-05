var SportsmanStats = React.createClass({
	getInitialState: function(){
		return {
			data: [],
			active: 0
		}
	},
	loadData: function(index){
		var self = this;
		if(index > 0){
			$.ajax({
				url: '/sportsmans/load',
				method: 'GET',
				data: 'index='+index,
				dataType: 'JSON',
				success: function(response){
					self.setState({data:response, active: index})
				}
			})
		}
	},
	componentWillMount: function(){
		console.log(this.props)
	},
	summElements: function(arr){
		return arr.reduce(function(sum, current) { return sum + current}, 0)
	},
	render: function(){
		var secondGraph = '';
		var points = [];
	    var dataUser = this.props.results.map(function(value, index){return {'x':index, 'y':value.result}}),
	    	dataMax = this.props.results.map(function(value, index){return {'x':index, 'y':Math.max(...value.all_results)}}),
	    	yMax = Math.max(...this.props.results.map(function(index){return Math.max(...index.all_results)})),
	    	xValues = this.props.results.map(function(value, index){return index}),
	    	dataMiddle = this.props.results.map(function(value, index){return {'x':index, 'y': this.summElements(value.all_results)/value.all_results.length}}, this);  	
	    
	    points = [dataMax, dataUser, dataMiddle];
		
		if(this.state.active > 0){
			secondGraph = <TableResults data={this.state.data}/>
		}
		return  (
			<div className="row">
				<div className="tabs">
					<Tabs data={this.props.list} action={this.loadData}/>
				</div>
				<div className="graphs">
					<h3>Результаты:</h3>
					<LineChart data={points} yMax={yMax} xValues={xValues} width={600} height={300}/>
				</div>
				<div className="content">
					{secondGraph}
				</div>
			</div>		
		)
	}
});