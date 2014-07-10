$(document).ready ->
  $(".additionalservice tbody tr.act").click ->
    $(this).find(".hidden").animate({height: "toggle"});
    if ($(this).find(".hidden").is(':visible'))
        $(this).find(".hidden").css('display','inline-block')

