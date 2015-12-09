require('dotenv').config({silent: true});
express       = require 'express'
app           = express()
morgan        = require 'morgan'
bodyParser    = require 'body-parser'
storeRoutes   = require './routes/stores'
homeRoutes    = require './routes/home'
errorhandler  = require 'errorhandler'

# Jade Engine
app.set 'views', './views' # specify the views directory
app.set 'view engine', 'jade' # register the template engine

# Request logging
app.use morgan 'combined'

# Static Files
app.use express.static 'dist'

# body-parser
app.use bodyParser.urlencoded
  extended: true

# home routes
app.use '/', homeRoutes

# Locations routes
app.use '/api/stores', storeRoutes

# robots.txt
app.get '/robots.txt', (req, res) ->
    res.type 'text/plain'
    res.send "User-agent: *\nDisallow: /"

# 404 pages
app.use (req, res) ->
  res.status(404).send 'Sorry cant find that!'

app.use errorhandler()

app.listen process.env.PORT || 3000
