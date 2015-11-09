require 'dotenv'
fs = require 'fs'
turf = require 'turf'
MapboxClient = require 'mapbox'
mapbox = new MapboxClient process.env.MAPBOX_SECRET_KEY
_ = require 'lodash'

getBaseLocation = (queryString, callback) ->
  mapbox.geocodeForward queryString, (err, res) ->
    throw err if err
    callback? res.features[0]

module.exports.all = all = (callback) ->
  fs.readFile './data/locations.json', (err, data) ->
    throw err if err
    callback? JSON.parse data

module.exports.sortByDistance = (queryString, callback) ->
  getBaseLocation queryString, (baseLocation) ->
    all (locations) ->
      _.forEach locations, (location, index) ->
        location.distance = turf.distance location, baseLocation
        locations[index] = location
      sortedLocations = _.sortBy locations, (location, index, locations) ->
        return location.distance
      callback? sortedLocations
