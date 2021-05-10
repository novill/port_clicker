# resort_grey: [[1174, 429, '#A6A6A6'], [1205, 450, '#A6A6A6']],
# resort_active: [[1174, 429, '#142E5A'], [1205, 450, '#122F5B']],
# resort_ready: [[1218, 427, '#5DF80F'], [1218, 446, '#05DD1E'], [1208, 436, '#2BE918'], [1228, 436, '#34EC16']],
# resort_done_button: [[758, 689, '#142E5A'], [879, 742, '#122F5B']],
# resort_close_button: [[1330, 307, ''], [1339, 318, '']],
# resort_send_button: [[818, 685, '#0079F8'], [950, 742, '#0059B8']],
#
def global_quest_run
  dputs 'если закончилось задание'
  ended_task = check_any_area_colors(:resort_ready, true)
  if ended_task
    sleep_move_and_click(:resort_grey)
    dputs 'принимаем его'
    sleep_move_and_click(:resort_done_button)
    dputs 'и закрваем потому что иначе сложно c логикой'
    sleep_move_and_click(:resort_close_button)
    logged_sleep(2)
  end
  if ended_task || check_all_area_colors(:resort_active, true)
    dputs 'открываем  окно'
    sleep_move_and_click(:resort_active)
    mouse_move(:empty_space)
    logged_sleep(2)
    if check_any_area_colors(:resort_send_button, false)
      dputs 'если есть кнопка отправить - отправляем'
      sleep_move_and_click(:resort_send_button)
      return true
    else
      dputs 'если нечего везти - закрваем'
      sleep_move_and_click(:resort_close_button)
    end
    return false
  end
end

