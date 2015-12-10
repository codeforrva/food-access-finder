# ----------------------------------
# Store Model
# ----------------------------------

# dependencies
request = require "request"

store =
  # Returns all stores
  #
  # @params {function} callback function
  all: (cb) ->
    request.get ' https://brigades.opendatanetwork.com/resource/q524-g4xp.json',(err, response, body) ->
      cb? err, response, body

  # Returns all stores within a given radius from a lat/latLng
  #
  # @param {array} lat/lng coordinates
  # @param {int} radius in meters
  # @params {function} callback function
  within: (latLng, radius, cb) ->
    requestUrl = " https://brigades.opendatanetwork.com/resource/q524-g4xp.json?$$exclude_system_fields=false&$where=within_circle(geography, #{latLng[1]}, #{latLng[0]}, #{radius})"
    request.get requestUrl, (err, response, body) ->
      cb? err, response, body

module.exports = store
