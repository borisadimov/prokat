Modal = require "templates/modal"
Minibike = require "templates/minibike"



$(document).ready ->


  modal = Modal()
  minibike = Minibike()
  $("body").append(modal)
  if storage.counter>0
    $(".footer .icon svg").attr "style", "opacity: 1"
    $(".bag").addClass "full"
    $(".modal_window .scroller").width 10+92*storage.counter
    if storage.counter < 4
      $(".leftar,.rightar").css("visibility","hidden")
    else
      $(".leftar").css "visibility", "hidden"
    for bike in storage.bikeArray
      tpl = $(minibike).clone()
      $(tpl).css("background-image", "url(#{bike.img})")
      $(tpl).find(".name").html("#{bike.model}")
      $(".modal_window .scroller").append(tpl)




  #Clicks
  $(".transpbg").click ->
    $(".modal_window").fadeOut 400
  $(".bag").click ->
    if $(this).hasClass("full")
      $(".modal_window").fadeIn 500
  $(".delete").click ->
    index = $(this).parent().parent().index()
    $(this).parent().parent().remove()
    storage.removeBikeByIndex(index)
    $(".modal_window .scroller").width 10+92*storage.counter
    if $(".minibike").length < 4
      $(".leftar,.rightar").css("visibility","hidden")
      if $(".minibike").length is 0
        $(".full").removeClass("full")
        $(".icon svg").fadeOut()
        $(".modal_window").fadeOut()
    else
      $(".leftar,.rightar").css("visibility","visible")

  slideLeft = () ->
      $('.slider').animate({scrollLeft: "#{$('.slider').scrollLeft()-93}px"}, 300)
  slideRight = () ->
      $('.slider').animate({scrollLeft: "#{$('.slider').scrollLeft()+93}px"}, 300)

  $(".leftar").click _.throttle(slideLeft, 500)
  $(".rightar").click _.throttle(slideRight, 500)
  $('.slider').scroll ->
    if $('.slider').scrollLeft() is 0
      $(".leftar").css("visibility","hidden")
    else
      if $(".minibike").length > 3
        $(".leftar").css("visibility","visible")
    if $('.slider').scrollLeft()+$('.slider').width() is $('.scroller').width()
      $(".rightar").css("visibility","hidden")
    else
      if $(".minibike").length > 3
        $(".rightar").css("visibility","visible")

class Bike
  constructor: (@model, @img, @url) ->

hasStorage = () ->
  try
    @hasStorage = `'localStorage' in window && window['localStorage'] != null`
  catch e
    @hasStorage = false
  @hasStorage
do hasStorage

if @hasStorage
  @storage = require("js/storage")




module.exports = @hasStorage