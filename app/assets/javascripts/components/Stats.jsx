var Stats = React.createClass({
	getInitialState: function(){
		return {
			data: this.props.data,
			active: 0,
			points: []
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
					self.setState({data:response[0].data, active: index, points: response[0].linedata})
				}
			})
		}else{
			this.setState({data:this.props.data, active: index})
		}
	},
	render: function(){
		var secondGraph;
		if(this.state.active > 0){
			
			secondGraph = <LineChart data={this.state.points} width={600} height={300}/>
		}else{
			secondGraph = <DonutChart  data={this.state.data} id='1'/>
			//secondGraph = <LineChart  data={data} width={600} height={300}/>
		}
		return  (
			<div className="container">
				<div className="tabs">
					<Tabs data={this.props.list} action={this.loadData}/>
				</div>
				<div className="content">
					<BarChart data={this.state.data}/>
					{secondGraph}
				</div>
			</div>		
		)
	}
});