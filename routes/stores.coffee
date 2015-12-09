# ----------------------------------
# Store Router
#
# all /stores routes
# ----------------------------------

# dependencies
express      = require 'express'
router       = express.Router()
Stores       = require '../models/store.coffee'
helpers = require '../helpers/storeHelpers.coffee'

# all storess
router.get '/', (req, res) ->
  Stores.all (err, response, body)->
    res.json JSON.parse(body)

# sorts By distance
router.post '/', helpers.getBaseLocation, (req, res) ->
  Stores.within req.baseLocation.geometry.coordinates, 1000, (err, response, body) ->
    _stores = helpers.transformCollection JSON.parse(body), req.baseLocation
    res.json
      status: 200
      data:
        baseLocation: req.baseLocation
        stores: _stores

module.exports = router
