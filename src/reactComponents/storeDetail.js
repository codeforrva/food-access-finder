var React = require('react');
var _     = require('lodash');
var $     = require('jquery');

var storeDetail = React.createClass({
  distroyDetail: function(){
    $('#store-detail').empty();
    $('#store-detail').removeClass('active');
  },
  render: function(){
    var _store = this.props.store.properties;
    var _distance = String(_.round(this.props.store.distance, 2)) + "mi";
    console.log(_store);
    return(
      <div className="store-detail">
        <div className="strore-detail__header">
          <i className="fa fa-map-marker"></i>
          <div className="store-detail__info">
            <h2>{_store.title} • {_distance}</h2>
          </div>
          <i className="fa fa-times-circle-o store-detail__close" onClick={this.distroyDetail}></i>
        </div>
        <div className="store-detail__content">
          <div className="flex-container">
            <div className="store-detail__basic-info">
              <p>{_store.address.streetAddress}</p>
              <p>{_store.address.city}, {_store.address.state} {_store.address.zip}</p>
              <a className="store-detail__basic-info__phone" href={"tel:" + _store.phone}>{_store.phone}</a>
            </div>
            <img className="store-detail__basic-info__icon" src="img/navigation-icon.png"/>
          </div>
          <hr/>
          <h3 className="store-detail__subheader">Nutrition Availability</h3>
          <a className="nutrition-info__my-plate" href="#">Learn More About MyPlate</a>
          <div className="flex-container">
            <div className="nutrition-list">
              <span className="fruit">Fruit</span>
              <span className="dairy">Dairy</span>
              <span className="protein">Protein</span>
              <span className="grains">Grains</span>
              <span className="vegetables">Vegatables</span>
            </div>
          </div>
          <hr/>
          <h3 className="store-detail__subheader">Benefits Welcome</h3>
          <div className="flex-container benefits">
            <span className="benefit active">SNAP</span>
            <span className="benefit">EBT</span>
            <span className="benefit active">WIC</span>
            <span className="benefit">2x Bucks</span>
          </div>
        </div>
      </div>
    );
  }
});

module.exports = storeDetail;
