store_list = require '../templates/store_list.jade'
_          = require 'lodash'
$          = require 'jquery'

_config =
  categoryMap:
    "healthy_corner_store" : "Healthy Corner Store"
    "farmers_market": "Farmer's Market"
  iconColorMap:
    "healthy_corner_store" : "#FF8736"
    "farmers_market" : "#78BB36"

addMarkerColor = (category) ->
  _color = _config.iconColorMap[category]
  return _color

format_distance = (distance) ->
  return String(_.round(distance, 2)) + "mi"

format_category = (category) ->
  return _config.categoryMap[category]

module.exports.formatStores = (stores) ->
  stores.forEach (store, index, stores) ->
    # Add Icon color
    store.properties["marker-color"] = addMarkerColor store.properties.category
    # add Even/Odd property
    store.properties._count = if index % 2 == 0 then "even" else "odd"
    # Format Category
    store.properties.category =
      raw: stores[index].properties.category
      formatted: format_category stores[index].properties.category
    store.properties.distance = format_distance stores[index].distance
    stores[index] = store
  return stores

module.exports.render = (stores) ->
  $('#content').empty().append store_list
    stores: stores
