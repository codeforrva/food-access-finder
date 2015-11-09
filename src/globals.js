module.exports = {
  map: {},
  storeLayer: {},
  setMarkers: function(stores){
    var _layer = this.storeLayer.setGeoJSON(stores);
    var _bounds = _layer.getBounds().pad(1);
    this.map.fitBounds(_bounds);
    this.map.invalidateSize(true);
  },
  getLocations: function(locationQuery){
    
  }
}
