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
  $(".point").click ->
    index = $(this).index()
    index0 = $(".point1").index()
    console.log(index)
    console.log(index0)
    ind = index - 1
    $(".point:nth-child(#{index0+1})").removeClass("point1")
    $(".point:nth-child(#{index0+1})").addClass("point"+ind)


    $(".point:nth-child(3)").removeClass("point1")
    $(".point:nth-child(4)").removeClass("point1")
    $(".point:nth-child(5)").removeClass("point1")
    $(".point:nth-child(6)").removeClass("point1")
    $(".point:nth-child(7)").removeClass("point1")
    $(".point:nth-child(#{index+1})").removeClass("point2")
    $(".point:nth-child(#{index+1})").removeClass("point3")
    $(".point:nth-child(#{index+1})").removeClass("point4")
    $(".point:nth-child(#{index+1})").removeClass("point5")
    $(".point:nth-child(#{index+1})").addClass("point1")


