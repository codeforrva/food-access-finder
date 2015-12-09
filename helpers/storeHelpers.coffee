# dependencies
require 'dotenv'
turf         = require 'turf'
MboxClient   = require 'mapbox'
mapbox       = new MboxClient process.env.MAPBOX_SECRET_KEY
errorHelpers = require "./errorHelpers.coffee"
_            = require "lodash"

getBaseLocation = (req, res, next) ->
  _query = req.body.query
  mapbox.geocodeForward _query, (err, response) ->
    throw err if err
    if response.features.length == 0
      errorHelpers.respondWithError(res, 422, "No location can be determined from that search query.")
    else
      req.baseLocation = response.features[0]
      next()

transform = (store, baseLocation) ->
  _store =
    properties:
      _id: store.uid
      title: store.title
      category: store.category
      address:
        street: store.geography_address
        city: store.geography_city
        state: store.geography_state
        zip: store.geography_zip
  if store.snap then _store.properties.snap = true else _store.properties.snap = false
  if store.wic && store.wic == "yes" then _store.properties.wic = true else _store.properties.wic = false
  if store.phonenumber then _store.properties.phone = parseInt(store.phonenumber) else _store.properties.phone = false
  if store.geography then _store.geometry = store.geography
  if baseLocation then _store.properties.distance = calculatateDistance baseLocation, store
  # Styling
  _store.type = "Feature"
  return _store

transformCollection = (storeCollection, baseLocation) ->
  return sortByDistance storeCollection.map (store) ->
    transform store, baseLocation

transformCollectionGeoJSON = (storeCollection, baseLocation) ->
  return sortByDistance storeCollection.map (store) ->
    transformGeoJSON store, baseLocation

calculatateDistance = (baseLocation, store) ->
  store.type = "Feature"
  store.properties = {}
  store.geometry = store.geography
  return turf.distance store, baseLocation

sortByDistance = (storeCollection) ->
  return _.sortBy storeCollection, (store) ->
    return store.distance

module.exports.getBaseLocation = getBaseLocation
module.exports.transform = transform
module.exports.transformCollection = transformCollection
module.exports.transformCollectionGeoJSON = transformCollectionGeoJSON
