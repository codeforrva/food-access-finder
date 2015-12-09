_  = require "lodash"

calcDistanc = (baseLocation, store) ->


module.exports.transform = transform = (store) ->
  _store =
    id: store.uid
    title: store.title
    category: store.category
    address:
      street: store.address1
      streetAux: store.address2
      city: store.city
      state: store.state
      zip: store.zipcode
  return _store

module.exports.transformCollection = (storeCollection) ->
  return storeCollection.map (store) ->
    transform(store)
