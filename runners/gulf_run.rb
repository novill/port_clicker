@gulf_big_ok_button = ScreenObject.new('gulf_big_ok_button', :moveable, [[977, 644, '#0079F8'], [1110, 708, '#0061C8']])

def gulf_run
  dputs 'кликнули в на gulf'
  sleep_move_and_click(@gulf)

  dputs 'кликнули на кнопку подтверждение'
  sleep_move_and_click(@gulf_big_ok_button)
end
