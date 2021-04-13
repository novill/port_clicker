@store_overload = false

def yoga_shop_decider
  @big_ship = check_area_colors(@construction_site, true, true)
  if @big_ship
    dputs 'Construction_site доступен'
  else
    dputs 'Construction_site не доступен'
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
  sleep_move_and_click('yoga_shop')

  @store_overload = !check_area_colors(:yoga_shop_ok_button, true, true)
  if !@store_overload
    dputs 'если склад не переполнен - везем'
    sleep_move_and_click(:yoga_shop_ok_button)
    return true
  else
    raise_unless_area(@store_full_form, 'везти нельзя только при переполненом складе проверим что это та форма')
    dputs 'закрыли форму переполненного склада'
    sleep_move_and_click(@store_full_ok_button)
  end
  false
end
