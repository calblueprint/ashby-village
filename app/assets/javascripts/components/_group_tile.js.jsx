// The React file defining each group tile.

var JoinButton = React.createClass({
	render: function() {
		return (
			<button>
				Join Group
			</button>
		);
	}
});

var MemberSection = React.createClass({
	render: function() {
		return (
			<div className="member-section">
				<h6>{this.props.member_count} MEMBERS</h6>
			</div>
		);
	}
});

var GroupTile = React.createClass({
	render: function() {
		return (
			<div className="group-tile row">
				<h3>{this.props.name}</h3>
				<h6>{this.props.kind.toUpperCase()} GROUP IN {this.props.neighborhood.toUpperCase()}</h6>
				<MemberSection member_count={this.props.member_count} members={this.props.members} />
				<JoinButton></JoinButton>
			</div>
		);
	}
});