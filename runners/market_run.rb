@market_no_yoga = false

def market_run
  dputs 'зашли в market'
  sleep_move_and_click(:market)
  mouse_sleep
  draise 'торговля НЕ yoga' unless check_all_area_colors(:market_yoga, false)

  @market_no_yoga = !check_all_area_colors(:market_ok_button, true)

  market_enough_yoga = check_any_area_colors(:market_enough_yoga, true)

  if !@market_no_yoga && market_enough_yoga
    dputs 'вывозим'
    sleep_move_and_click(:market_ok_button)
    @store_overload = false
    return true
  else
    dputs 'вывозить нечего - закрываем окно'
    sleep_move_and_click(:market_close_button)
  end
  false
end
