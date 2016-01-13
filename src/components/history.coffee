history = require 'history'
$       = require 'jquery'

$(document).ready () ->
  window._faHistory = history.createHistory()
  window._faHistory.listen (location)->
    console.log location
