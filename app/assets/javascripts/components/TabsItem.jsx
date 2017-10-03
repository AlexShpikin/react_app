var TabsItem = React.createClass({
	render: function(){
		return (
			<li className={this.props.param}>
					<span onClick={this.props.setActive}>{this.props.data.title}</span>
			</li>
		)	
	}
})