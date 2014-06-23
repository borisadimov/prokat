<<<<<<< HEAD
time = 1500

$(document).ready ->
  $(".dot_block li").click (e) ->
    index = $(this).index()
    $(".dot").removeClass("active")
    # — решетка это комент, :eq() jQuery селектор типа :nth-child в CSS
    # "my Var = #{x}" это интерполяция строки эквивалентно:
    # "my Var"+x ; интерполяция работает только в двойных кавычках
    # "работает: #{x}"   |  'не работает: #{x}'
    $(".dot:eq(#{index})").addClass('active')
    $('.slide').fadeOut(time)
    $(".slide:eq(#{index})").fadeIn(time)

=======
`
$(document).ready(function(){
  var time = 1500;
  console.log("йоу");

  $('.dot2').click(function()
  {
    console.log("йоу");
    $('.dot1').removeClass('active');
    $('.dot3').removeClass('active');
    $('.dot4').removeClass('active');
    $('.dot5').removeClass('active');
    $('.dot6').removeClass('active');
    $('.dot7').removeClass('active');
    $('.dot2').addClass('active');
    $('.bikes').fadeOut(time);
    $('.rolls').fadeIn(time);
    $('.left_arrow').addClass('disp');
  });

  $('.right_arrow').click (function()
  {
    $('.dot1').removeClass('active');
    $('.dot3').removeClass('active');
    $('.dot4').removeClass('active');
    $('.dot5').removeClass('active');
    $('.dot6').removeClass('active');
    $('.dot7').removeClass('active');
    $('.dot2').addClass('active');
    $('.left_arrow').addClass('disp');
    $('.bikes').fadeOut(time);
    $('.rolls').fadeIn(time);
  });
});

`

>>>>>>> 4f7d314be11e0abfe5d059f61a5893c8a8ffa653
