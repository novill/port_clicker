@market_no_excavation = false
@market_ok_button = ScreenObject.new('market_ok_button', :moveable, [[926, 699, '#0080F9'], [1029, 755, '#0064C3']])
@market_close_button = ScreenObject.new('market_close_button', :moveable, [[1286, 292, '#CE002C'], [1296, 301, '#CE002C']])
@market_library = ScreenObject.new('market_library', :moveable, [[883, 554, '#D52F4E']])
@market_enough_library =
    ScreenObject.new(:market_enough_library, :moveable,
                     [[870, 633, '#FBFFFF'], [873, 633, '#FBFFFF'], [876, 633, '#FBFFFF'], [878, 633, '#FBFFFF'], [880, 633, '#FBFFFF']], :partial)
                     # [[870, 626, '#FBFFFF'], [873, 626, '#FBFFFF'], [876, 626, '#FBFFFF'], [878, 626, '#FBFFFF'], [880, 626, '#FBFFFF']], :partial)

# @market_excavation = ScreenObject.new('market_excavation', :moveable, [[890, 570, '#E26D21']])
# @market_enough_excavation =
#     ScreenObject.new(:market_enough_excavation, :moveable,
#                      [[870, 633, '#FBFFFF'], [873, 633, '#FBFFFF'], [876, 633, '#FBFFFF'], [878, 633, '#FBFFFF'], [880, 633, '#FBFFFF']], :partial)


def market_run
  dputs 'зашли в market'
  sleep_move_and_click(@market)
  mouse_sleep
  draise 'торговля НЕ library' unless check_all_area_colors(@market_library, false)
  # draise 'торговля НЕ excavation' unless check_all_area_colors(@market_excavation, false)

  @market_no = !check_all_area_colors(@market_ok_button, true)

  market_enough_library = check_any_area_colors(@market_enough_library, true)

  if !@market_no && market_enough_library
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
