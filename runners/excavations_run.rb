@store_overload = false

def excavation_decider
  mouse_sleep
  @big_ship = check_all_area_colors(:excavation, true)
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
  dputs 'кликнули на excavation'
  sleep_move_and_click(:excavation)
  mouse_sleep
  @store_overload = !check_all_area_colors(:big_ok_button, true)
  if !@store_overload
    dputs 'если склад не переполнен - везем'
    sleep_move_and_click(:big_ok_button)
    return true
  else
    raise_unless_area(:store_full_form)
    dputs 'закрыли форму переполненного склада'
    sleep_move_and_click(:store_full_ok_button)
  end
  false
end
