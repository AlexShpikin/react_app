var TableResults = React.createClass({
	getInitialState: function(){
		return {
			data: this.props.data
		}
	},
	render: function(){
		var list = this.props.data.map(function(item, index){
			return (
				<TableResultsItem data={item} key={index} />
			)
		});
		return (
			<table className="table">
				<thead>
					<tr>
						<td><b>Спортсмен</b></td>
						<td><b>Результат</b></td>
						<td><b>Место</b></td>
					</tr>
				</thead>
				<tbody>
					{list}
				</tbody>
			</table>
		)
	}
})