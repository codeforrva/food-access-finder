# ----------------------------------
# Store List Component
#
# containes logic for store list
# ----------------------------------

# dependencies
store_list = require '../templates/store_list.jade'
_          = require 'lodash'
$          = require 'jquery'

# component configuration
_config =
  # maps category machine name with human name
  categoryMap:
    "healthy_corner_store" : "Healthy Corner Store"
    "farmers_market": "Farmer's Market"
  # maps icon color with category machine name
  iconColorMap:
    "healthy_corner_store" : "#FF8736"
    "farmers_market" : "#78BB36"

# returns marker color given a store's
# category
#
# @param {string} category machine name
addMarkerColor = (category) ->
  _color = _config.iconColorMap[category]
  return _color

# formats raw distance number by rounding
# and adding units
#
# @param {float} distance
format_distance = (distance) ->
  return String(_.round(distance, 2)) + "mi"

# formats category human-friendly name
#
# @param {string} category machine name
format_category = (category) ->
  return _config.categoryMap[category]

# formats store properties for human-friendliness
#
# @param {array} store objects
module.exports.formatStores = (stores) ->
  stores.forEach (store, index, stores) ->
    # Add Icon color
    store.properties["marker-color"] = addMarkerColor store.properties.category
    # add Even/Odd property
    store.properties._count = if index % 2 == 0 then "even" else "odd"
    # format Category
    store.properties.category =
      raw: stores[index].properties.category
      formatted: format_category stores[index].properties.category
    store.properties.distance = format_distance stores[index].distance
    stores[index] = store
  return stores

# renders store list template with data
#
# @param {array} store objects
module.exports.render = (stores) ->
  $('#content').empty().append store_list
    stores: stores
  document.getElementById('map').style.height = "40vh"
  document.getElementById('map').style.position = "relative"
  $('#content').addClass 'results'
