$(document).ready ->
  $(".additionalservice tbody tr.act").click ->
    index = $(this).index()
    $(".additionalservice tbody tr:eq(#{index+1})").slideToggle('slow')

