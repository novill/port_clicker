@excavation = ScreenObject.new('excavation', :moveable, [[1246, 258, '#27385E'], [1272, 280, '#27375C']])
@excavation_overload_form = ScreenObject.new('excavation_overload_form', :moveable, [[792, 342, '#E90046'], [1107, 405, '#E90046']])
@excavation_overload_ok_button = ScreenObject.new('excavation_overload_ok_button', :moveable, [[908, 642, 'красный'], [1049, 710, '#красный2']])
@excavation_big_ok_button = ScreenObject.new('excavation_big_ok_button', :moveable, [[977, 644, '#0079F8'], [1110, 708, '#0061C8']])



@store_overload = false

def excavation_decider
  mouse_free
  @big_ship = check_all_area_colors(@excavation, true)
  if @big_ship
    dputs 'excavation доступен'
  else
    dputs 'excavation не доступен'
    return false
  end

  if @store_overload
    dputs 'Склад переполнен'
    return false
  else
    return true
  end
end

def excavation_run
  return false unless excavation_decider

  dputs 'кликнули на excavation'
  sleep_move_and_click(@excavation)
  mouse_free
  @store_overload = !check_area_colors(@excavation_big_ok_button, true)
  if !@store_overload
    dputs 'если склад не переполнен - везем'
    sleep_move_and_click(@excavation_big_ok_button)
    return true
  else
    dputs 'закрыли форму переполненного склада'
    sleep_move_and_click(@excavation_overload_ok_button)
  end
  false
end
