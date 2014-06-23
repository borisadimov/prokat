`
var time = 1500;


$('.dot2').onclick = (function()
{
  $('.dot1').removeClass('active');
  $('.dot3').removeClass('active');
  $('.dot4').removeClass('active');
  $('.dot5').removeClass('active');
  $('.dot6').removeClass('active');
  $('.dot7').removeClass('active');
  $('.dot2').addClass('active');
  $('.bikes').fadeOut(time);
  $('.rolls').fadeIn(time);
});
`
