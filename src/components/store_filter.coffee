# ----------------------------------
# Store Filter Component
#
# containes logic for store list
# ----------------------------------

# dependencies
$ = require "jquery"
form = require './form.coffee'

filters = {
  'snap': {
    value: 'snap',
    include: true
  },
  'wic':{
  value: 'wic',
  include: true
  },
  'ebt':{
  value: 'ebt',
  include: true
  }
}

module.exports.filterList= (storeList) ->
  console.log(storeList)
  filteredList = []
  for i in [0...storeList.length]
    store = storeList[i]
    category = store.properties.category.raw
    if (filters[category].include)
      filteredList.push(store)
  return filteredList

# sets event listeners and function execution
$(document).ready () ->
  # select all listener
  $(".store-filter__toggles .select-all").click (e) ->
    $(".store-filter input[type='checkbox']").prop "checked", true
  # un-select all listener
  $(".store-filter__toggles .unselect-all").click (e) ->
    $(".store-filter input[type='checkbox']").prop "checked", false
  $(".list-header input[type=checkbox]").click (e, input) ->
    if filters[this.value] && this.checked
      filters[this.value].include = true;
      return;
    else
      filters[this.value].include = false;
      return;
  # update click listener
  $(".update_search_filters").click (e) ->
    $(".store-filter").addClass "hidden"
    form.findStores(window.map.getCenter().lng + ","+window.map.getCenter().lat, false, true)
  $(".store-filter__cancel").click (e) ->
    $(".store-filter").addClass "hidden"




