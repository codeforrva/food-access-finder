request = require "request"

store =
  all: (cb) ->
    request.get ' https://brigades.opendatanetwork.com/resource/q524-g4xp.json',(err, response, body) ->
      cb? err, response, body

  within: (latLng, radius, cb) ->
    requestUrl = " https://brigades.opendatanetwork.com/resource/q524-g4xp.json?$$exclude_system_fields=false&$where=within_circle(geography, #{latLng[1]}, #{latLng[0]}, #{radius})"
    request.get requestUrl, (err, response, body) ->
      cb? err, response, body

module.exports = store
