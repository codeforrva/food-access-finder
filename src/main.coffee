# ----------------------------------
# Main.coffee
#
# manifset file for all client-side js logic
# ----------------------------------

# js components
require './components/form.coffee'
require './components/store_detail.coffee'
require './components/store_filter.coffee'
require './components/history.coffee'

# dependencies
require 'mapbox.js'
_globals = require './globals.coffee'
$        = require 'jquery'

$(document).ready () ->
  # Provide your access token
  L.mapbox.accessToken = 'pk.eyJ1IjoiY29kZWZvcnJ2YSIsImEiOiI2Zl90Nk53In0.Z5abzPIO5z45GKyaizMFIg'
  # Create a map in the div #map
  map = L.mapbox.map('map', 'mapbox.outdoors').setView [37.5333, -77.4667], 10
  storeLayer = L.mapbox.featureLayer().addTo map

  window.map = map || {}
  window.storeLayer = storeLayer || {}
