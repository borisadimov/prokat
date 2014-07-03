Minibike = require "templates/minibike"
isCoinAnimated = false
@isCoinAnimated = isCoinAnimated
class Bike
  constructor: (@model, @img, @url) ->


$ ->
  $(window).scroll ->
    if $(window).scrollTop() >= 130
      $('.submenu.fix').addClass 'fixed'
      $('.menu').addClass 'menu_fix'
      if $(window).scrollTop() >= $(".social").offset().top-$(window).height()+50
        $('.footer').addClass "relative"
        $('.social').addClass "relative"
      else
        $('.footer').removeClass "relative"
        $('.social').removeClass "relative"
    else
      $('.submenu.fix').removeClass 'fixed'
      $('.menu').removeClass 'menu_fix'

    if isCoinAnimated
      newTop = $(".footer .icon").offset().top-$(window).scrollTop()
      newLeft = $(".footer .icon").offset().left-$(window).scrollLeft()
      $(".coin").stop()
      .animate {top: newTop},  { queue: false, duration:1000, easing: "easeOutQuart"}
      .animate {left: newLeft},  { queue: false, duration:1000, complete: ->
        $(".coin").animate {opacity: "0"}, 200
        $(".icon svg").attr("style", "opacity: 1")
        isCoinAnimated = false
      }

  $(".button.putInBag").click (e) ->
    if bag
      top = e.pageY-$(window).scrollTop()
      left = e.pageX-$(window).scrollLeft()
      newTop = $(".footer .icon").offset().top-$(window).scrollTop()
      newLeft = $(".footer .icon").offset().left-$(window).scrollLeft()
      $(".coin").css
        top: top
        left: left

      $(".coin").animate {opacity: "1"},  { queue: false, duration:20, easing: "easeInQuart", complete: ->
        isCoinAnimated = true
      }
      .animate {top: newTop},  { queue: false, duration:1000, easing: "easeOutQuart"}
      .animate {left: newLeft},  { queue: false, duration:1000, complete: ->
        $(".coin").animate {opacity: "0"}, 200, ()->
          $(".coin").css("top","0px")
        $(".icon svg").attr("style", "opacity: 1")
        isCoinAnimated = false
      }
      minibike = Minibike()
      parent = $(this).parent()
      name = $(parent).find("h3").html()
      img = $(parent).find("img").attr("src")
      url = $(parent).find("a").attr("href")
      bicycle = new Bike(name, img, url)
      storage.addBike(bicycle)
      $(".bag").addClass("full") if not $(".bag").hasClass("full")
      tpl = $(minibike).clone()
      $(tpl).css("background-image", "url(#{img})")
      $(tpl).find(".name").html("#{name}")
      $(".modal_window .scroller").append(tpl)
      $(".modal_window .scroller").width 10+92*storage.counter
      if $(".minibike").length < 4
        $(".leftar,.rightar").css("visibility","hidden")
        if $(".minibike").length is 0
          $(".full").removeClass("full")
          $(".icon svg").fadeOut()
          $(".modal_window").fadeOut()
      else
        $(".leftar,.rightar").css("visibility","visible")
      $(".delete").click ->
        index = $(this).parent().parent().index()
        $(this).parent().parent().remove()
        storage.removeBikeByIndex(index)
        $(".modal_window .scroller").width 10+92*storage.counter
        #console.log storage.counter
        if $(".minibike").length < 4
          $(".leftar,.rightar").css("visibility","hidden")
          if $(".minibike").length is 0
            $(".full").removeClass("full")
            $(".icon svg").fadeOut()
            $(".modal_window").fadeOut()
        else
          $(".leftar,.rightar").css("visibility","visible")

    else
      alert "Ваш браузер не поддерживает технологию Local Storage, для того что бы забронировать велосипед позвоните по телефону: 256-43-26"

