var React    = require('react');
var ReactDOM = require('react-dom');
var $        = require ('jquery');
var _globals = require('../globals');
var ListHeader = require('./listHeader');

var LocationForm = React.createClass({
  render: function(){
    return (
      <div className="location-form">
        <h1>Food for Health</h1>
        <form id="find-location">
          <input type="text" ref="location" id="location-input" className="search" defaultValue={this.props.fieldValues.locationQuery} placeholder="Enter a Location" />
          <button onClick={this.getStores} id="location-submit" type="submit" className="submit">Search</button>
        </form>
      </div>
    );
  },
  getStores: function(e){
      var _this = this;
      e.preventDefault();
      var locationQuery = this.refs.location.value;
      console.log('getStore Executing...');
      $.post('/locations/byDistance', {query: locationQuery})
      .done(function(data){
        var data = {
          stores: data,
          locationQuery: locationQuery
        }
        _this.props.saveValues(data);
        _this.props.showStores('results');
        document.getElementById('map').style.height = "40vh";
        document.getElementById('map').style.position = "relative";
        $('#content').addClass('results');;
        _globals.setMarkers(data.stores);
        ReactDOM.render(<ListHeader locationQuery={locationQuery} showStores={_this.props.showStores} />, document.getElementById('list-header'));
      });
  }
});

module.exports = LocationForm;
