_ = require "lodash"

_stores = []

storeCache =
  setStores: (stores) ->
    _stores = stores;
  getStores: ->
    return _stores


module.exports = storeCache;
