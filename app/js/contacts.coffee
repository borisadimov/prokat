current = 0

initialize = () ->
  mapOptions =
    center: new google.maps.LatLng(47.225754,39.729253)
    zoom: 16
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


a = [{x: 47.225754,y: 39.729253}, {x: 47.2117602, y: 39.727971}, {x: 47.2985102, y: 39.785704}, {x: 47.2117081, y: 39.5882418}, {x: 47.228489, y: 39.744771} ]
$(document).ready ->
  $(".point2 li").click ->
    index = $(this).index()
    console.log index
    $(".point2 li:eq(#{index})").slideToggle('slow')
    $(".point1 li:eq(#{index})").fadeIn('slow')
    xy = new google.maps.LatLng(a[index].x, a[index].y)
    cEnter = new google.maps.LatLng(a[0].x, a[0].y)
    myOptions =
      zoom: 16
      center: cEnter
      mapTypeId: google.maps.MapTypeId.ROADMAP
    styles = [
      {
        stylers: [
          { saturation: -100 }
        ]
      }
    ]
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)
    map.setOptions({styles: styles})
    map.panTo(xy)
    $(".point2 li:eq(#{current})").slideToggle('slow')
    $(".point1 li:eq(#{current})").fadeOut('slow')
    current = index



