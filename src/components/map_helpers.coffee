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
module.exports.setMarkers = (storeData, is_update, user_move) ->
  is_update = is_update || false
  user_move = user_move || false
  # Set data as layer's geoJSON
  _layer = window.storeLayer.setGeoJSON storeData
  _bounds = _layer.getBounds()
  # Fit map to markers if user didn't cause the change
  if(!user_move)
    window.map.fitBounds _bounds

  # Force re draw of map due to change
  # in container div size
  window.map.invalidateSize true



module.exports.getMapSize = ->
#register reload of map when map is moved
  bounds = window.map.getBounds()
  northEast = bounds.getNorthEast()
  center = bounds.getCenter()
  console.log("distance: "+northEast.distanceTo(center))
  return northEast.distanceTo(center)


