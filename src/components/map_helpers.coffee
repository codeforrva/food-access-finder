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
  # if map size isn't changing (is_update == true)
  # then don't pad bounds
  # @TODO: determine why padding is needed
  if is_update
    _bounds = _layer.getBounds().pad 0
  else
    _bounds = _layer.getBounds().pad 1
  # Fit map to markers
  window.map.fitBounds _bounds
  # Force re draw of map due to change
  # in container div size
  window.map.invalidateSize true
