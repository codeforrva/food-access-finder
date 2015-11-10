var React     = require('react');
var ReactDOM  = require('react-dom');
var StoreList = require('./storeList');

var ListHeader = React.createClass({
  updateStores: function(e){
    console.log(this.props);
    e.preventDefault();
    var _this = this;
  },
  render: function(){
    return(
      <div className="list-header">
        <i className="fa fa-filter"></i>
        <input type="text" ref="list_location" defaultValue={this.props.locationQuery} />
        <i onClick={this.props.showStores('results')} className="fa fa-search"></i>
      </div>
    );
  }
})

module.exports = ListHeader;
