Height = $(window).height()-228
$(document).ready ->
  if Height > 400
    $(".content").css({"min-height": Height-((Height-507)/2), "padding-top": (Height-507)/2 })

  $(window).off "scroll"