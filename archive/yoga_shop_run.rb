@store_overload = false

def yoga_shop_decider
  mouse_sleep
  @big_ship = check_all_area_colors(:yoga_shop, true)
  if @big_ship
    dputs 'yoga shop доступен'
  else
    dputs 'yoga shop не доступен'
    return false
  end

  if @store_overload
    dputs 'Склад переполнен'
    return false
  else
    return true
  end
end

def yoga_shop_run
  dputs 'кликнули на yoga_shop'
  sleep_move_and_click(:yoga_shop)
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
