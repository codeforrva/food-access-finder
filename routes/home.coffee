express = require 'express'
router = express.Router()

# define the home page route
router.get '/', (req, res) ->
  res.render 'home/index'

module.exports = router
