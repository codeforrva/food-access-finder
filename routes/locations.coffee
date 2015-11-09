express = require 'express'
router = express.Router()
Locations = require '../models/locations'

# all locationss
router.get '/', (req, res) ->
  Locations.all (locations)->
    res.json locations

# sort By distance
router.post '/byDistance', (req, res) ->
  Locations.sortByDistance req.body.query, (locations) ->
    res.json locations

module.exports = router
