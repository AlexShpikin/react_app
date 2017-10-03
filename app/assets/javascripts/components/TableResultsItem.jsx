var TableResultsItem = React.createClass({
	render: function(){
		return (
			<tr>
				<td>{this.props.data.name+' '+this.props.data.sername}</td>
				<td>{this.props.data.result}</td>
				<td>{this.props.data.place}</td>
			</tr>
		)
	}
})