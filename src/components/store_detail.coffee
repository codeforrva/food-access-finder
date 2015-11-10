store_detail = require '../templates/store_detail.jade'
_            = require 'lodash'
$            = require 'jquery'

getStoreById = (id) ->
  _store = _.find window._stores, (store) ->
    _id = parseInt store.properties._id
    return  _id == id
  return _store

$(document).ready ()->
  # show Detail
  $('#content').on 'click', '.store', (e) ->
    console.log "STORE CLICKED"
    _id = parseInt $(this).attr 'data-id'
    _store = getStoreById _id
    console.log _store
    $('#store-detail').html store_detail
      store: _store
    $('#store-detail').addClass('active')
  # remove detail
  $('#store-detail').on 'click', '.store-detail__close', (e) ->
    $('#store-detail').empty().removeClass('active')
