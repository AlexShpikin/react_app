var TableResults = React.createClass({
	propTypes: {
	    data: React.PropTypes.array
	},
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
				<TableHead />
				<tbody>
					{list}
				</tbody>
			</table>
		)
	}
})