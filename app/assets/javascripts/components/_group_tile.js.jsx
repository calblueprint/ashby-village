// The React file defining each group tile.

var GroupTile = React.createClass({
	render: function() {
		return (
			<div className="group-tile row">
				<h3>{this.props.name}</h3>
				<h6>{this.props.kind.toUpperCase()} GROUP IN {this.props.neighborhood.toUpperCase()}</h6>
			</div>
		)
	}
});