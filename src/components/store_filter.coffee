# ----------------------------------
# Store Filter Component
#
# containes logic for store list
# ----------------------------------

# dependencies
$ = require "jquery"

# sets event listeners and function execution
$(document).ready () ->
  # select all listener
  $(".store-filter__toggles .select-all").click (e) ->
    $(".store-filter input[type='checkbox']").prop "checked", true
  # un-select all listener
  $(".store-filter__toggles .unselect-all").click (e) ->
    $(".store-filter input[type='checkbox']").prop "checked", false
  # update click listener
  $(".store-filter__actions__update").click (e) ->
    $(".store-filter").addClass "hidden"
