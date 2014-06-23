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

