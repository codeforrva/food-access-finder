# ----------------------------------
# Home Router
#
# all root-level routes
# ----------------------------------

# dependencies
express = require 'express'
router  = express.Router()

# defines the home page route
router.get '/', (req, res) ->
  res.render 'home/index'

module.exports = router
