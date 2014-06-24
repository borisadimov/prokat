isCoinAnimated = false


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

  $(".button").click (e)->

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
      $(".coin").animate {opacity: "0"}, 200
      $(".icon svg").attr("style", "opacity: 1")
      isCoinAnimated = false
    }

