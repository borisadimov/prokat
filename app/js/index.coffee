window.move = 0
time = 1500
$(document).ready ->
  move = require('js/move')
  window.move = move
  index0 = $(".dot.active").parent().index()
  $(".dot_block li").click (e) ->
    index0 = $(".dot.active").parent().index()
    index1 = $(this).index()
    if index1 isnt (6 or 0)
      $(".right_arrow").addClass("disp")
      $(".left_arrow").addClass("disp")
    if index1 is 6
      $(".right_arrow").removeClass("disp")
    if index1 is 0
      $(".left_arrow").removeClass("disp")
    $(".dot").removeClass("active")
    $(".dot:eq(#{index1})").addClass('active')
    if index1 - index0 > 0
      i = index1 - index0 + 1
      ind0 = index0
      while i>0
        ind0 = ind0+1
        console.log(ind0)
        move(".slide:nth-child(#{ind0})")
        .set('left','200%')
        .duration('1s')
        .delay("0.#{i}s")
        .end()
        i = i-1
      move(".slide:nth-child(#{index1+1})")
      .set('left','50%')
      .duration('2s')
      .end()
    else
      i = index0 - index1 + 1
      ind0 = index1
      while i>0
        ind0 = ind0+1
        if ind0 isnt index0 + 1
          move(".slide:nth-child(#{ind0})")
          .set('left','200%')
          .duration('0s')
          .end()
        move(".slide:nth-child(#{ind0})")
        .set('left','-150%')
        .duration('1s')
        .delay("0.#{i}s")
        .end()
        i = i-1
      move(".slide:nth-child(#{index1+1})")
      .set('left','50%')
      .duration('2s')
      .end()
    index0 = index1
  $(".right_arrow").click (e) ->
    index0 = $(".dot.active").parent().index()
    $(".dot").removeClass("active")
    $(".dot:eq(#{index0+1})").addClass('active')
    if index0 is 5
      $(".right_arrow").removeClass("disp")
    move(".slide:nth-child(#{index0+1})")
    .set('left','200%')
    .duration('1.5s')
    .end()
    move(".slide:nth-child(#{index0+2})")
    .set('left','50%')
    .duration('1.5s')
    .end()
    move(".title:nth-child(#{index0+1}) p")
    .set('left','200%')
    .duration('1s')
    .end()
    move(".title:nth-child(#{index0+2}) p")
    .set('left','50%')
    .duration('1s')
    .end()
    $(".left_arrow").addClass("disp")
    index0 = index0+1
  $(".left_arrow").click (e) ->
    index0 = $(".dot.active").parent().index()
    console.log(index0)
    $(".dot").removeClass("active")
    $(".dot:eq(#{index0-1})").addClass('active')
    if index0 is 1
      $(".left_arrow").removeClass("disp")
    move(".slide:nth-child(#{index0})")
    .set('left','200%')
    .duration('0s')
    .end()
    move(".slide:nth-child(#{index0})")
    .set('left','50%')
    .duration('1s')
    .end()
    move(".slide:nth-child(#{index0+1})")
    .set('left','-150%')
    .duration('1s')
    .end()
    $(".right_arrow").addClass("disp")
    #index0 = index0-1


