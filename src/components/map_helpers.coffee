# ----------------------------------
# Map Helper Functions
#
# containes helpers to handle map manipulation
# and behavor
# ----------------------------------

# Sets map markers
#
# @param {array} storeData
# @param {boolean} is_update
# @return {null}
module.exports.setMarkers = (storeData, is_update) ->
  is_update = is_update || false
  # Set data as layer's geoJSON
  _layer = window.storeLayer.setGeoJSON storeData
  _bounds = _layer.getBounds()
  # Fit map to markers
  window.map.fitBounds _bounds
  # Force re draw of map due to change
  # in container div size
  window.map.invalidateSize true
