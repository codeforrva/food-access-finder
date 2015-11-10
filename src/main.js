require('mapbox.js');
// var React          = require('react');
// var ReactDOM       = require('react-dom');
// var LocationFinder = require('./components/locationFinder');
var $              = require('jquery');
var _globals       = require('./globals.js')


$(document).ready(function(){
  // ReactDOM.render(<LocationFinder />, document.getElementById('content'));
  console.log("Document Ready");
  // Provide your access token
  L.mapbox.accessToken = 'pk.eyJ1IjoiY29kZWZvcnJ2YSIsImEiOiI2Zl90Nk53In0.Z5abzPIO5z45GKyaizMFIg';
  // Create a map in the div #map
  _globals.map = L.mapbox.map('map', 'mapbox.outdoors').setView([37.5333, -77.4667], 10);
  _globals.storeLayer = L.mapbox.featureLayer().addTo(_globals.map);
});
