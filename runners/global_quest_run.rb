@global_grey = ScreenObject.new('global_grey', :moveable, [[1174, 429, '#A6A6A6'], [1205, 450, '#A6A6A6']])
@global_active = ScreenObject.new('global_active', :moveable, [[1174, 429, '#142E5A'], [1205, 450, '#122F5B']])
@global_ready  = ScreenObject.new('global_ready', :moveable, [[1218, 427, '#5DF80F'], [1218, 446, '#05DD1E'], [1208, 436, '#2BE918'], [1228, 436, '#34EC16']])
@global_done_button = ScreenObject.new('global_done_button', :moveable, [[758, 689, '#142E5A'], [879, 742, '#122F5B']])
@global_close_button  = ScreenObject.new('global_close_button', :moveable, [[1330, 307, ''], [1339, 318, '']])
@global_send_button  = ScreenObject.new('global_send_button', :moveable, [[818, 685, '#0079F8'], [950, 742, '#0059B8']])

def global_quest_run
  ended_task = check_any_area_colors(@global_ready, true)
  if ended_task
    dputs 'если закончилось задание'
    sleep_move_and_click(@global_grey)
    dputs 'принимаем его'
    sleep_move_and_click(@global_done_button)
    dputs 'и закрваем потому что иначе сложно c логикой'
    sleep_move_and_click(@global_close_button)
    logged_sleep(2)
  end

  if ended_task || check_all_area_colors(@global_active, true)
    dputs 'готово к выполнению новое задание'
    sleep_move_and_click(@global_active)
    mouse_free
    if check_any_area_colors(@global_send_button, false)
      dputs 'если есть кнопка отправить - отправляем'
      sleep_move_and_click(@global_send_button)
      return true
    end

    dputs 'если нечего везти - закрваем'
    sleep_move_and_click(@global_close_button)
    logged_sleep(2)
    return false
  end
end

