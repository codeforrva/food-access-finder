# ----------------------------------
# Form component
#
# containes logic for location form
# and list header form
# ----------------------------------

# dependencies
$           = require 'jquery'
store_list  = require './store_list.coffee'
map_helpers = require './map_helpers.coffee'
error_message = require '../templates/error_message.jade'

# config object
_config =
  location_form: "#find-location"
  update_submit: ".update-submit"
  filter: ".fa-filter"
  errors:
    noLocation: "No Location could be determined from this request. Please try again"

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
findStores = (location_query, is_update) ->
  # new stores, not an update
  is_update = is_update || false
  # ajax request
  $.post '/stores/byDistance',
    query: location_query
  .done (data) ->
    if data.length > 0
      # format store data to be display friendly
      _stores = store_list.formatStores data
      # add stores to global object
      window._stores = _stores
      # add location query to global object
      window._location_query = location_query
      # render store list
      store_list.render _stores
      # update list header
      updateListHeader location_query
      # set map markers
      map_helpers.setMarkers _stores, is_update
    else
      showError()

# sets event listeners
$(document).ready ->
  $(_config.location_form).submit (e) ->
    e.preventDefault()
    _value = $('#location-input').val()
    findStores _value
  $(_config.update_submit).click (e) ->
    _value = $('input[name=location-header]').val()
    findStores _value, true
  $(_config.filter).click (e) ->
    $('.store-filter').removeClass "hidden"
