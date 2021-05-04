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

