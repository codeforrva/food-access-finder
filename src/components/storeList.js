var React        = require('react');
var ReactDOM     = require('react-dom');
var StoreDetail  = require('./storeDetail');
var _            = require('lodash');
var $            = require ('jquery');

var Store = React.createClass({
  renderStoreDetail: function(e){
    ReactDOM.render(<StoreDetail store={this.props.store} />, document.getElementById('store-detail'));
    $('#store-detail').addClass('active');
  },
  render: function(){
    console.log(this.props.store);
    var _className = "store " + this.props.store.evenOdd;
    var _store = this.props.store.properties;
    return (
      <div className={_className} onClick={this.renderStoreDetail}>
        <i className="fa fa-map-marker"></i>
        <div className="store__info">
          <h2>{_store.name} • {_store.distance}</h2>
          <p>{_store.category}</p>
        </div>
        <span className="fa-stack fa-lg">
          <i className="fa fa-circle-o fa-stack-2x"></i>
          <i className="fa fa-chevron-right fa-stack-1x"></i>
        </span>
      </div>
    );
  }
});

var StoreList = React.createClass({
  render: function() {
    var stores = this.props.data.stores.map(function(store, index){
      store.properties.distance = String(_.round(store.distance, 2)) + "mi";
      store.evenOdd = (index+1) % 2 == 0 ? "even" : "odd";
      return(
        <Store key={store.properties.name} store={store} />
      );
    });
    return (
      <div className="store-list">
        {stores}
      </div>
    );
  }
});



module.exports = StoreList;
