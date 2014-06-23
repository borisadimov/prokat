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


