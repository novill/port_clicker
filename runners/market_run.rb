@market_ok_button = [[926, 693, '#0080F9'], [1029, 749, '#0064C3']]
@market_close_button = [[1286, 292, '#CE002C'], [1296, 301, '#CE002C']]
@market_wheelbarrow = [[888, 556, '#67422F']]
@market_no_wheelbarrow = false

@market_enough_wheelbarrow = [[870, 626, '#FBFFFF'], [873, 626, '#FBFFFF'], [876, 626, '#FBFFFF'], [878, 626, '#FBFFFF'], [880, 626, '#FBFFFF']]

def market_run
  dputs 'зашли в market'
  sleep_move_and_click(@market)

  draise 'торговля НЕ тачками' unless check_area_colors(@market_wheelbarrow)

  @market_no_wheelbarrow = !check_area_colors(@market_ok_button, true, true)

  market_enough_wheelbarrow = check_any_area_colors(@market_enough_wheelbarrow, true, true)

  if !@market_no_wheelbarrow && market_enough_wheelbarrow
    dputs 'вывозим'
    sleep_move_and_click(@market_ok_button)
    @store_overload = false
    return true
  else
    dputs 'вывозить нечего - закрываем окно'
    sleep_move_and_click(@market_close_button)
  end
  false
end
