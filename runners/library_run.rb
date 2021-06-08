@library = ScreenObject.new('library', :moveable, [[1222, 514, '#263B48'], [1254, 533, '#263B48']])
@library_overload_form = ScreenObject.new('library_overload_form', :moveable, [[792, 342, '#E90046'], [1107, 405, '#E90046']])
@library_overload_ok_button = ScreenObject.new('library_overload_ok_button', :moveable, [[908, 642, 'красный'], [1049, 710, '#красный2']])
@library_big_ok_button = ScreenObject.new('library_big_ok_button', :moveable, [[977, 644, '#0079F8'], [1110, 708, '#0061C8']])



@store_overload = false

def library_decider
  mouse_free
  @big_ship = check_all_area_colors(@library, true)
  if @big_ship
    dputs 'library доступен'
  else
    dputs 'library не доступен'
    return false
  end

  if @store_overload
    dputs 'Склад переполнен'
    return false
  else
    return true
  end
end

def library_run
  return false unless library_decider

  dputs 'кликнули на library'
  sleep_move_and_click(@library)
  mouse_free
  @store_overload = !check_area_colors(@library_big_ok_button, true)
  if !@store_overload
    dputs 'если склад не переполнен - везем'
    sleep_move_and_click(@library_big_ok_button)
    return true
  else
    dputs 'закрыли форму переполненного склада'
    sleep_move_and_click(@library_overload_ok_button)
  end
  false
end
