@big_ok_small_town_button = [[977, 644, '#0079F8'], [1110, 708, '#0061C8']]

def small_town_run
  dputs 'кликнули в на small_town'
  sleep_move_and_click(@small_town)

  dputs 'кликнули на кнопку подтверждение'
  sleep_move_and_click(@big_ok_small_town_button)
end
