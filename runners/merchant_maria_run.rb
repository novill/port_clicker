# просто активный торгоыец
@merchant_maria_active = ScreenObject.new(
    'merchant_maria_active',
    :moveable,
    # [[996, 649, '#0F0222'], [1040, 660, '#0F0222']]
    [[1003, 702, '#F1D300'], [1014, 717, '#F4F8F8']]
  )
# сделано задание - есть галочка
@merchant_maria_ready = ScreenObject.new(
    'merchant_maria_ready',
    :moveable,
    [[1030, 693, '#EF495D']]
  )

# перезарядка - задание выполнено, наград получена, джем 2 часа до следующего
@merchant_maria_reload = ScreenObject.new(
    'merchant_maria_reload',
    :moveable,
    [[972, 650, '#1582F4'], [989, 659, '#1582F4']]
)

# кнопка закончить задание и получить награду
@merchant_maria_done_button = ScreenObject.new(
    'merchant_maria_done_button',
    :fixed,
    [[911, 675, ''], [1040, 733, '']]
  )
# кнопка отправить корабль на выполнение задания
@merchant_maria_send_button = ScreenObject.new(
    'merchant_maria_send_button',
    :fixed,
    [[911, 675, '#0079F7'], [1040, 733, '#0062C9']],
  )
# кнопка закрыть диалог с отправкой корабля
@merchant_maria_close_button = ScreenObject.new(
    'merchant_maria_close_button',
    :fixed,
    [[1297, 319, ''], [1311, 333, '']]
  )

@merchant_maria_task_finished_at = nil

def merchant_maria_run
  dputs "merchant_maria_run 1"
  if @merchant_maria_task_finished_at
    reload_time =  (Time.now - @merchant_maria_task_finished_at).to_i / 60
    if reload_time < 120
      dputs "Таймер перезарядки: осталось #{120 - reload_time} минут"
      return false
    end
  end

  dputs "merchant_maria_run 2"
  if check_any_area_colors(@merchant_maria_reload, true)
    dputs 'торговец на перезарядке'
    return false
  end

  dputs "merchant_maria_run 3"
  if check_any_area_colors(@merchant_maria_ready, true)
    dputs 'если закончилось задание'
    sleep_move_and_click(@merchant_maria_active)
    dputs 'принимаем вознаграждение'
    sleep_move_and_click(@merchant_maria_done_button)
    dputs 'и закрываем - торговец уходит на перзарядку'
    sleep_move_and_click(@merchant_maria_close_button)
    @merchant_maria_task_finished_at = Time.now
    return false
  end

  dputs "merchant_maria_run 4"
  if check_all_area_colors(@merchant_maria_active, true)
    dputs 'торговец активен'
    sleep_move_and_click(@merchant_maria_active)
    mouse_free
    if check_any_area_colors(@merchant_maria_send_button, false)
      dputs 'если активна кнопка отправить - отправляем'
      sleep_move_and_click(@merchant_maria_send_button)
      return true
    else
      dputs 'если нечего везти - закрываем'
      sleep_move_and_click(@merchant_maria_close_button)
    end
    return false
  end
end