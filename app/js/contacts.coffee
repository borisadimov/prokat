current = 0
resize = () ->
  Height = $(window).height()-228
  if Height > 400
      $(".contentt").css({"height": Height})
      $("body").css({"height": Height})
      $(".innerrr").css({"height": Height})
      $(".white_block").css({"height": Height})

initialize = () ->
  get_ww = () ->
    frameWidth = 480
    if self.innerWidth
      frameWidth = self.innerWidth
    else
      if (document.documentElement && document.documentElement.clientWidth)
        frameWidth = document.documentElement.clientWidth
      else
        if (document.body)
          frameWidth = document.body.clientWidth
    return frameWidth
  dx = get_ww()
  xx = 47.228652
  yy = 39.7348182
  if dx>800
    xx = xx - ((dx-800)*(0.000005))
  mapOptions =
    center: new google.maps.LatLng(xx,yy)
    zoom: 16
    mapTypeId: google.maps.MapTypeId.ROADMAP
  point = new google.maps.LatLng(47.225182, 39.728823)
  styles = [
    {
      stylers: [
        { saturation: -100 }
      ]
    }
  ]
  map = new google.maps.Map(document.querySelector("#map_canvas"), mapOptions)
  map.setOptions({styles: styles})
  image = new google.maps.MarkerImage(
   'i/pointer.png',
    new google.maps.Size(105,105),
    new google.maps.Point(0,0),
    new google.maps.Point(50,70)
  )
  shape =
    coord: [68,0,73,1,77,2,79,3,82,4,84,5,86,6,88,7,90,8,91,9,93,10,94,11,95,12,96,13,98,14,99,15,100,16,101,17,102,18,103,19,103,20,104,21,105,22,106,23,107,24,107,25,108,26,109,27,109,28,110,29,110,30,111,31,111,32,112,33,112,34,113,35,113,36,114,37,114,38,114,39,115,40,115,41,115,42,116,43,116,44,116,45,116,46,116,47,117,48,117,49,117,50,117,51,117,52,117,53,117,54,117,55,117,56,117,57,117,58,117,59,117,60,117,61,117,62,117,63,117,64,117,65,117,66,117,67,117,68,117,69,116,70,116,71,116,72,116,73,116,74,115,75,115,76,115,77,114,78,114,79,114,80,113,81,113,82,112,83,112,84,111,85,111,86,110,87,110,88,109,89,109,90,108,91,107,92,107,93,106,94,105,95,104,96,103,97,103,98,102,99,101,100,100,101,99,102,98,103,96,104,95,105,94,106,93,107,91,108,90,109,88,110,86,111,84,112,82,113,79,114,77,115,73,116,68,117,49,117,44,116,40,115,38,114,35,113,33,112,31,111,29,110,27,109,26,108,24,107,23,106,22,105,21,104,19,103,18,102,17,101,16,100,15,99,14,98,14,97,13,96,12,95,11,94,10,93,10,92,9,91,8,90,8,89,7,88,7,87,6,86,6,85,5,84,5,83,4,82,4,81,3,80,3,79,3,78,2,77,2,76,2,75,1,74,1,73,1,72,1,71,1,70,0,69,0,68,0,67,0,66,0,65,0,64,0,63,0,62,0,61,0,60,0,59,0,58,0,57,0,56,0,55,0,54,0,53,0,52,0,51,0,50,0,49,0,48,1,47,1,46,1,45,1,44,1,43,2,42,2,41,2,40,3,39,3,38,3,37,4,36,4,35,5,34,5,33,6,32,6,31,7,30,7,29,8,28,8,27,9,26,10,25,10,24,11,23,12,22,13,21,14,20,14,19,15,18,16,17,17,16,18,15,19,14,21,13,22,12,23,11,24,10,26,9,27,8,29,7,31,6,33,5,35,4,38,3,40,2,44,1,49,0,68,0],
    type: 'poly'
  marker = new google.maps.Marker
    draggable: false
    raiseOnDrag: false
    icon: image
    shape: shape
    map: map
    position: point



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

$(window).resize ->
  do resize

a = [{x: 47.2181009,y: 39.7348923}, {x: 47.2041071, y: 39.7336103}, {x: 47.2908571, y: 39.7913433}, {x: 47.204055, y: 39.5938811}, {x: 47.2208359, y: 39.7504103} ]
b = [{x: 47.225754,y: 39.729253}, {x: 47.2117602, y: 39.727971}, {x: 47.2985102, y: 39.785704}, {x: 47.2117081, y: 39.5882418}, {x: 47.228489, y: 39.744771} ]
$(document).ready ->
  do resize

  $(window).off "scroll"

  $(".point2 li").click ->
    index = $(this).index()
    console.log index
    $(".point2 li:eq(#{index})").slideToggle('slow')
    $(".point1 li:eq(#{index})").fadeIn('slow')

    get_ww = () ->
      frameWidth = 480
      if self.innerWidth
        frameWidth = self.innerWidth
      else
        if (document.documentElement && document.documentElement.clientWidth)
          frameWidth = document.documentElement.clientWidth
        else
          if (document.body)
            frameWidth = document.body.clientWidth
      return frameWidth
    dx = get_ww()
    xx = a[index].x
    yy = a[index].y
    if dx>800
      xx = xx + ((dx-800)*(0.000005))
    xy = new google.maps.LatLng(xx, yy)
    cEnter = new google.maps.LatLng(a[0].x, a[0].y)
    myOptions =
      zoom: 16
      center: cEnter
      mapTypeId: google.maps.MapTypeId.ROADMAP
    point = new google.maps.LatLng(b[index].x, b[index].y)
    styles = [
      {
        stylers: [
          { saturation: -100 }
        ]
      }
    ]
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)
    map.setOptions({styles: styles})
    image = new google.maps.MarkerImage(
     'i/pointer.png',
      new google.maps.Size(105,105),
      new google.maps.Point(0,0),
      new google.maps.Point(50,70)
    )
    shape =
      coord: [68,0,73,1,77,2,79,3,82,4,84,5,86,6,88,7,90,8,91,9,93,10,94,11,95,12,96,13,98,14,99,15,100,16,101,17,102,18,103,19,103,20,104,21,105,22,106,23,107,24,107,25,108,26,109,27,109,28,110,29,110,30,111,31,111,32,112,33,112,34,113,35,113,36,114,37,114,38,114,39,115,40,115,41,115,42,116,43,116,44,116,45,116,46,116,47,117,48,117,49,117,50,117,51,117,52,117,53,117,54,117,55,117,56,117,57,117,58,117,59,117,60,117,61,117,62,117,63,117,64,117,65,117,66,117,67,117,68,117,69,116,70,116,71,116,72,116,73,116,74,115,75,115,76,115,77,114,78,114,79,114,80,113,81,113,82,112,83,112,84,111,85,111,86,110,87,110,88,109,89,109,90,108,91,107,92,107,93,106,94,105,95,104,96,103,97,103,98,102,99,101,100,100,101,99,102,98,103,96,104,95,105,94,106,93,107,91,108,90,109,88,110,86,111,84,112,82,113,79,114,77,115,73,116,68,117,49,117,44,116,40,115,38,114,35,113,33,112,31,111,29,110,27,109,26,108,24,107,23,106,22,105,21,104,19,103,18,102,17,101,16,100,15,99,14,98,14,97,13,96,12,95,11,94,10,93,10,92,9,91,8,90,8,89,7,88,7,87,6,86,6,85,5,84,5,83,4,82,4,81,3,80,3,79,3,78,2,77,2,76,2,75,1,74,1,73,1,72,1,71,1,70,0,69,0,68,0,67,0,66,0,65,0,64,0,63,0,62,0,61,0,60,0,59,0,58,0,57,0,56,0,55,0,54,0,53,0,52,0,51,0,50,0,49,0,48,1,47,1,46,1,45,1,44,1,43,2,42,2,41,2,40,3,39,3,38,3,37,4,36,4,35,5,34,5,33,6,32,6,31,7,30,7,29,8,28,8,27,9,26,10,25,10,24,11,23,12,22,13,21,14,20,14,19,15,18,16,17,17,16,18,15,19,14,21,13,22,12,23,11,24,10,26,9,27,8,29,7,31,6,33,5,35,4,38,3,40,2,44,1,49,0,68,0],
      type: 'poly'
    marker = new google.maps.Marker
      draggable: false
      raiseOnDrag: false
      icon: image
      shape: shape
      map: map
      position: point
    map.panTo(xy)
    $(".point1 li:eq(#{current})").fadeOut()
    $(".point2 li:eq(#{current})").slideToggle('slow')
    current = index



