# готов к заказу
@edgar_active = ScreenObject.new(
    'edgar_active',
    :moveable,
    [[998, 479, '#1C3459'], [1031, 485, '#7C3E31']]
)
# заказ выполнен
@edgar_ready = ScreenObject.new(
    'edgar_ready',
    :moveable,
    [[ 1046, 478, '#59F70F'], [ 1046, 497, '#07DE1E'], [ 1038, 485, '#39ED15'], [ 1058, 485, '#39ED15']]
)

@edgar_collect = ScreenObject.new(
    'edgar_collect',
    :moveable,
    [[859, 688, '#0079F7'], [986, 746, '#0062C9']]
)

@edgar_close = ScreenObject.new(
    'edgar_close',
    :moveable,
    [[1329, 305, ''], [1339, 316, '']]
)

@edgar_set_sail = ScreenObject.new(
    'edgar_set_sail',
    :moveable,
    [[1017, 686, '#0079F8'], [1146, 746, '#0062C9']]
)

def edgar_run
  dputs 'проверили статус edgar'
  mouse_free
  if check_area_colors(@edgar_ready, true)
    dputs 'закончено задание'
    sleep_move_and_click(@edgar_active)
    dputs 'собрали награду'
    sleep_move_and_click(@edgar_collect)
    dputs 'закрыли окно'
    sleep_move_and_click(@edgar_close)
  end

  if check_area_colors(@edgar_active, true)
    dputs "Эдгар готов принимать грузы"
    sleep_move_and_click(@edgar_active)
    mouse_free
    if check_area_colors(@edgar_set_sail)
      dputs "отправляем корабль"
      sleep_move_and_click(@edgar_set_sail)
      return true
    else
      dputs "отправлять нечего - закрываем"
      sleep_move_and_click(@edgar_close)
    end
  end
end
