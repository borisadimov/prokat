window.move = 0
time = 1500
$(document).ready ->
  move = require('js/move')
  window.move = move
  index0 = $(".dot.active").parent().index()
  $(".dot_block li").click (e) ->
    index1 = $(this).index()
    $(".dot").removeClass("active")
    $(".dot:eq(#{index1})").addClass('active')
    if index1 - index0 > 0
      i = index1 - index0 + 1
      ind0 = index0
      while i>0
        setTimeout ()->
          ind0 = ind0+1
          console.log(ind0)
          move(".slide:nth-child(#{ind0})")
          .set('left','200%')
          .duration('1s')
          .end()
          i = i-1
        , 1000
      move(".slide:nth-child(#{index1+1})")
      .set('left','50%')
      .duration('2s')
      .end()
    index0 = index1
  # $(".right_arrow").click (e) ->
  #   index = $(".dot.active").parent().index()
  #   console.log(index)
  #   if index is 5
  #     $(".right_arrow").removeClass("disp")
  #   $(".dot").removeClass("active")
  #   $(".dot:eq(#{index+1})").addClass('active')
  #   $('.slide').fadeOut(time)
  #   $(".slide:eq(#{index+1})").fadeIn(time)
  #   $(".left_arrow").addClass("disp")
  # $(".left_arrow").click (e) ->
  #   index = $(".dot.active").parent().index()
  #   console.log(index)
  #   if index is 1
  #     $(".left_arrow").removeClass("disp")
  #   $(".dot").removeClass("active")
  #   $(".dot:eq(#{index-1})").addClass('active')
  #   $('.slide').fadeOut(time)
  #   $(".slide:eq(#{index-1})").fadeIn(time)


