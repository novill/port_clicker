def small_town_run
  dputs 'кликнули в на small_town'
  sleep_move_and_click(:small_town)

  dputs 'кликнули на кнопку подтверждение'
  sleep_move_and_click(:big_ok_button)
end
