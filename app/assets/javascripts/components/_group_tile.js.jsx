// The React file defining each group tile.
var MemberSection = React.createClass({
	render: function() {
		return (
			<h6>{this.props.member_count} MEMBERS</h6>
		);
	}
});

var GroupTile = React.createClass({
	render: function() {
		return (
			<div className="group-tile row">
				<h3>{this.props.name}</h3>
				<h6>{this.props.kind.toUpperCase()} GROUP IN {this.props.neighborhood.toUpperCase()}</h6>
				<MemberSection member_count={this.props.member_count} />
			</div>
		);
	}
});