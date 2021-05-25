#! ruby
require_relative 'support/mouse_move'
require_relative 'support/wait_and_sleep'
require_relative 'support/remove_captain'

require_relative 'runners/gulf_run'
require_relative 'runners/small_town_run'
require_relative 'runners/merchant_maria_run'
require_relative 'runners/edgar_run'
require_relative 'runners/excavations_run'
require_relative 'runners/market_run'
require_relative 'runners/global_quest_run'

@dy = 0
# @dy = 27
@dx = 0

@market = ScreenObject.new('market', :moveable,[[1147, 650, '#122F5B'], [1175, 670, '#122F5B']])
@gulf = ScreenObject.new('gulf', :moveable, [[748, 651, '#122F5B'], [778, 669, '#122F5B']])

# @any_ship = ScreenObject.new('any_ship', :fixed, [[360, 447, '#22C901'], [468, 477, '#1A9402'], [360, 447, '#007DF1'], [448, 477, '#006DD3']], :partial)
# @free_ship  = ScreenObject.new('free_ship', :fixed, [[360, 447, '#007DF1'], [468, 477, '#006DD3']])

@any_ship = ScreenObject.new('any_ship', :fixed, [[360, 336, '#22C901'], [468, 365, '#1A9402'], [360, 336, '#007DF1'], [468, 365, '#006DD3']], :partial)
@free_ship  = ScreenObject.new('free_ship', :fixed,[[360, 336, '#007DF1'], [468, 365, '#006DD3']])


@more_than_1k_sailors = ScreenObject.new('more than 1k sailors', :fixed,
  [[1548, 228, '#FBFFFF'], [1547, 234, '#FBFFFF'], [1550, 234, '#FBFFFF'], [1550, 230, '#FBFFFF']], :partial)
@skip_small_town_times = 0

def main_circle
  fail_unless_global_position
  fail_unless_global_position unless wait_for(@free_ship)
  enough_sailors = wait_for(@more_than_1k_sailors)

  dputs 'разгрузили корабль'
  sleep_move_and_click(@free_ship)

  remove_captain_if_needed

  dputs 'выбрали его'
  sleep_move_and_click(@free_ship)

  return if global_quest_run

  return if excavation_run

  return if market_run

  @skip_small_town_times = 10 unless enough_sailors

  if enough_sailors && (@skip_small_town_times <= 0) && (rand(100) > 20 )
    small_town_run
  else
    gulf_run
    @skip_small_town_times -= 1
  end
  sleep(1)
end

def fail_unless_global_position
  check_points = [@market, @gulf, @any_ship]

  mouse_free
  check_points.each do |check_point|
    raise_unless_area(check_point)
  end
end

