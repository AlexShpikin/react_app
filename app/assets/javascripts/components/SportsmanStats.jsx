var SportsmanStats = React.createClass({
	getInitialState: function(){
		return {
			data: this.props.data,
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
	render: function(){
		var secondGraph = '';
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
					<LineChart  data={this.props.points[0]} width={600} height={300}/>
				</div>
				<div className="content">
					{secondGraph}
				</div>
			</div>		
		)
	}
});