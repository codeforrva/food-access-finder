require('dotenv').config({silent: true});
express = require 'express'
app = express()
morgan = require 'morgan'
bodyParser = require 'body-parser'
locationRoutes = require './routes/locations'
homeRoutes = require './routes/home'

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
app.use '/locations', locationRoutes

app.listen '3000'
