initialize = () ->
  mapOptions =
    center: new google.maps.LatLng(47.225754,39.729253)
    zoom: 18
    mapTypeId: google.maps.MapTypeId.ROADMAP
  styles = [
    {
      stylers: [
        { saturation: -100 }
      ]
    }
  ]

  map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions)
  map.setOptions({styles: styles})

$(document).ready ->
  move = require('js/move')
  window.move = move
  do initialize
  page_h = $(window).height() - 178  + 'px'
  move(".content")
  .set("height",page_h)
  .duration('0s')
  .end()
  move(".innerrr")
  .set("height",page_h)
  .duration('0s')
  .end()
  move(".white_block")
  .set("height",page_h)
  .duration('0s')
  .end()
$(window).resize ->
  move = require('js/move')
  window.move = move
  page_h = $(window).height() - 178  + 'px'
  move(".content")
  .set("height",page_h)
  .duration('0s')
  .end()
  move(".innerrr")
  .set("height",page_h)
  .duration('0s')
  .end()
  move(".white_block")
  .set("height",page_h)
  .duration('0s')
  .end()

$(document).ready ->
  index0 = $(".point.activve").index()
  $(".point").click ->
    index1 = $(this).index()
    $(".point:nth-child(#{index0+1})").removeClass("activve")
    $(".point:nth-child(#{index1+1})").addClass("activve")
    index0 = index1

