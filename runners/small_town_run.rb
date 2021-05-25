@small_town = ScreenObject.new('small_town', :moveable, [[1043, 739, '#122F5B'], [1072, 760, '#122F5B']])
@small_town_big_ok_button = ScreenObject.new('big_ok_button', :moveable, [[977, 644, '#0079F8'], [1110, 708, '#0061C8']])

def small_town_run
  dputs 'кликнули в на small_town'
  sleep_move_and_click(@small_town)

  dputs 'кликнули на кнопку подтверждение'
  sleep_move_and_click(@small_town_big_ok_button)
end
