module.exports = {
  map: {},
  storeLayer: {},
  iconColorMap: {
    "healthy_corner_store": "#FF8736",
    "farmers_market": "#78BB36"
  },
  setIconColors: function(storeData){
    storeData.forEach(function(store, index, storeData){
      storeData[index].properties["marker-color"] = this.iconColorMap[store.properties.category];
    }, this);
    return storeData;
  },
  setMarkers: function(stores){
    var _stores = this.setIconColors(stores);
    var _layer = this.storeLayer.setGeoJSON(_stores);
    var _bounds = _layer.getBounds().pad(1);
    this.map.fitBounds(_bounds);
    this.map.invalidateSize(true);
  },
}
