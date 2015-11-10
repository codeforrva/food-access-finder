$            = require "jquery"

$(document).ready () ->

  $(".store-filter__toggles .select-all").click (e) ->
    $(".store-filter input[type='checkbox']").prop "checked", true

  $(".store-filter__toggles .unselect-all").click (e) ->
    $(".store-filter input[type='checkbox']").prop "checked", false

  $(".store-filter__actions__update").click (e) ->
    $(".store-filter").addClass "hidden"
