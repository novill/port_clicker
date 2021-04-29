def gulf_run
  dputs 'кликнули в на gulf'
  sleep_move_and_click(:gulf)

  dputs 'кликнули на кнопку подтверждение'
  sleep_move_and_click(:big_ok_button)
end
