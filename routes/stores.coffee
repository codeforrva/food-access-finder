# ----------------------------------
# Store Router
#
# all /stores routes
# ----------------------------------

# dependencies
express   = require 'express'
router    = express.Router()
Stores    = require '../models/stores'

# all storess
router.get '/', (req, res) ->
  Stores.all (stores)->
    res.json stores

# sorts By distance
router.post '/byDistance', (req, res) ->
  Stores.sortByDistance req.body.query, (stores) ->
      res.json stores

module.exports = router
