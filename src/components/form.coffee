$ = require 'jquery'
store_list = require './store_list.coffee'
map_helpers = require './map_helpers.coffee'

_config =
  location_form: "#find-location"
  update_submit: ".update-submit"

updateListHeader = (location_query) ->
  $('.list-header').removeClass('hidden')
  $('input[name=location-header]').attr "value", location_query


findStores = (location_query, is_update) ->
  is_update = is_update || false
  $.post '/locations/byDistance',
    query: location_query
  .done (data) ->
    _stores = store_list.formatStores data
    window._stores = _stores
    window._location_query = location_query
    store_list.createList _stores
    document.getElementById('map').style.height = "40vh"
    document.getElementById('map').style.position = "relative"
    $('#content').addClass 'results'
    updateListHeader location_query
    map_helpers.setMarkers _stores, is_update

$(document).ready () ->
  $(_config.location_form).submit (e) ->
    e.preventDefault()
    _value = $('#location-input').val()
    findStores _value
  $(_config.update_submit).click (e) ->
    _value = $('input[name=location-header]').val()
    findStores _value, true
