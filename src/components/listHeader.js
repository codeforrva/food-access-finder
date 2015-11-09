var React    = require('react');

var ListHeader = React.createClass({
  render: function(){
    return(
      <div className="list-header">
        <i className="fa fa-filter"></i>
        <input type="text" ref="list-location" defaultValue={this.props.locationQuery} />
        <i className="fa fa-search"></i>
      </div>
    );
  }
})

module.exports = ListHeader;
