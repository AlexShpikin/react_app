var Tabs = React.createClass({
	getInitialState: function(){
		return {
			active: 0
		}
	},
	handleClick: function(e){
		this.props.action(e.target.value);
	},
	render: function(){
		var data = this.props.data;
		var active = this.state.active;
		var List = data.map(function(item, index){
			return (
				<option value={item.id} key={index}>{item.title}</option>
			)
		});
		return(
			<select name="select"  onChange={this.handleClick}>
				<option value="0">Все</option>
				{List}
			</select>		
		)
	}
})