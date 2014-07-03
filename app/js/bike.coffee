Height = $(window).height()-268
$(document).ready ->
  if Height > 400
    $(".content").css({"height": Height-((Height-507)/2), "padding-top": (Height-507)/2 })

  $(window).off "scroll"