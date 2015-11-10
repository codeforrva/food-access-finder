module.exports.setMarkers = (storeData, is_update) ->
  is_update = is_update || false
  _layer = window.storeLayer.setGeoJSON storeData
  if is_update
    _bounds = _layer.getBounds().pad 0
  else
    _bounds = _layer.getBounds().pad 1
  window.map.fitBounds _bounds
  window.map.invalidateSize true
