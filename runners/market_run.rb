@market_no_excavation = false
@market_ok_button = ScreenObject.new('market_ok_button', :moveable, [[926, 693, '#0080F9'], [1029, 749, '#0064C3']])
@market_close_button = ScreenObject.new('market_close_button', :moveable, [[1286, 292, '#CE002C'], [1296, 301, '#CE002C']])
@market_excavation = ScreenObject.new('market_excavation', :moveable, [[890, 570, '#D25F1D']])
@market_enough_excavation =
    ScreenObject.new(:market_enough_excavation, :moveable,
                     [[870, 626, '#FBFFFF'], [873, 626, '#FBFFFF'], [876, 626, '#FBFFFF'], [878, 626, '#FBFFFF'], [880, 626, '#FBFFFF']], :partial)


def market_run
  dputs 'зашли в market'
  sleep_move_and_click(@market)
  mouse_sleep
  draise 'торговля НЕ excavation' unless check_all_area_colors(@market_excavation, false)

  @market_no_excavation = !check_all_area_colors(@market_ok_button, true)

  market_enough_excavation = check_any_area_colors(@market_enough_excavation, true)

  if !@market_no_excavation && market_enough_excavation
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
