# ----------------------------------
# Store Model
#
#
# ----------------------------------

# dependencies
require 'dotenv'
fs         = require 'fs'
turf       = require 'turf'
MboxClient = require 'mapbox'
mapbox     = new MboxClient process.env.MAPBOX_SECRET_KEY
_          = require 'lodash'

# returns geocoded location
#
# @param {string} queryString
# @param {function} callback function
getBaseLocation = (queryString, callback) ->
  mapbox.geocodeForward queryString, (err, res) ->
    throw err if err
    if res.features.length == 0
      callback? null
    else
      callback? res.features[0]

# returns all stores
#
# @param {function} callback function
module.exports.all = all = (callback) ->
  fs.readFile './data/stores.json', (err, data) ->
    throw err if err
    callback? JSON.parse data

# returns stores sorted by distance
# from location query
#
# @param {string} queryString
# @param {function} callback function
module.exports.sortByDistance = (queryString, callback) ->
  # geocode location
  getBaseLocation queryString, (baseLocation) ->
    if baseLocation
      # get all stores
      all (stores) ->
        # foreach location, get distance
        _.forEach stores, (store, index) ->
          store.distance = turf.distance store, baseLocation
          stores[index] = store
        # sort stores by distance
        sortedStores = _.sortBy stores, (store, index, stores) ->
          return store.distance
        callback? sortedStores
    else
      callback? {}
