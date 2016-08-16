# ----------------------------------
# Form component
#
# containes logic for location form
# and list header form
# ----------------------------------

# dependencies
$             = require 'jquery'
store_list    = require './store_list.coffee'
map_helpers   = require './map_helpers.coffee'
error_message = require '../templates/error_message.jade'
history       = require 'history'
filters       = require './store_filter.coffee'

# config object
_config =
  location_form: "#find-location"
  update_submit: ".update-submit"
  filter: ".filter"
  errors:
    noLocation: "No Location could be determined from this request. Please try again"
  geolocate_button: "#geolocate-button"

# Updates display state of list-header, and adds
# location query as input value
#
# @param {string} location_query
updateListHeader = (location_query) ->
  $('.list-header').removeClass('hidden')
  $('input[name=location-header]').attr "value", location_query

showError = ->
 $(_config.location_form).before error_message
  message: _config.errors.noLocation

# makes ajax request to geocode location query
# and formats return data for display
#
# @param {string} location_query
# @param {string} is_update
findStores = (location_query, is_update, user_move) ->
  # new stores, not an update
  is_update = is_update || false
  user_move = user_move || false
  bounds=undefined
  if user_move
    bounds=map_helpers.getMapSize()
    $('#list-header-input').val('')
  # ajax request
  $.post '/api/stores',
    query: location_query
    bounds: bounds
  .done (res) ->
    if res.data.stores.length > 0
      # format store data to be display friendly
      _stores = store_list.formatStores res.data.stores
      _stores = filters.filterList(_stores)
      # add stores to global object
      window._stores = _stores
      # add location query to global object
      window._location_query = location_query
      # render store list
      store_list.render _stores
      # update list header
      updateListHeader location_query
      # set map markers
      map_helpers.setMarkers _stores, is_update, user_move

    else
      showError()

getCurrentLocationFromNavigator = (msg)->
  navigator.geolocation.getCurrentPosition(
    success = (e) ->
      console.log("success "+e)
      coords = e.coords
      $('#location-input').val(coords.longitude+','+coords.latitude)
      $('#location-submit').click()
    fail = (e) ->
      console.log("failed to search by location: " +e.message)
  )



# sets event listeners
$(document).ready ->
  $(_config.filter).hide()
  $(_config.location_form).submit (e) ->
    e.preventDefault()
    this.isFirstLoad = true
    _value = $('#location-input').val()
    findStores _value
  $(_config.update_submit).click (e) ->
    _value = $('input[name=location-header]').val()
    findStores _value, true, false
  $("#content").on "click", _config.filter, (e) ->
    console.log "Filter Clicked"
    $('.store-filter').removeClass "hidden"
  $(_config.geolocate_button).click (e) ->
    getCurrentLocationFromNavigator "words"


module.exports.findStores = (location_query, is_update, user_move)->
  findStores(location_query, is_update, user_move)

module.exports.isFirstLoad = false
