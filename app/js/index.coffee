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
    #TODO: Сделать фэйды паралаксовой анимацией слева направо, анимируя
    #      через css transition, меняя в js только конечные координаты
    $('.slide').fadeOut(time)
    $(".slide:eq(#{index})").fadeIn(time)

