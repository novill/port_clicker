#! ruby
require_relative 'support/mouse_move'
require_relative 'support/wait_and_sleep'
require_relative 'support/remove_captain'

require_relative 'runners/gulf_run'
require_relative 'runners/small_town_run'
require_relative 'runners/merchant_maria_run'
require_relative 'runners/edgar_run'
require_relative 'runners/excavations_run'
require_relative 'runners/library_run'
require_relative 'runners/market_run'
# require_relative 'runners/global_quest_run'

@ship_list_top = ScreenObject.new('ship_list_top', :fixed, [[55, 255, '#2273FF']])
@ship_ads = ScreenObject.new('ship_ads', :fixed, [[102, 310, '#FFD700'], [102, 350, '#FFD700']])
@oil_field_anchors_top_left = ScreenObject.new('oil_field_anchors_top_left', :moveable, [[557, 577, '#4CE53D']])
@oil_field_anchors_top_left_out_left = ScreenObject.new('oil_field_anchors_top_left_out_left', :moveable, [[556, 577, '#B9CEE3']])
@oil_field_anchors_top_left_out_top = ScreenObject.new('oil_field_anchors_top_left_out_top', :moveable, [[557, 576, '#B9CEE3']])

def set_dxy
  @dx = 0
  # @dy = 0
  @dy = 27
  @ads_dy = 111

end

set_dxy

@market = ScreenObject.new('market', :moveable,[[1147, 650, '#122F5B'], [1175, 670, '#122F5B']])
@gulf = ScreenObject.new('gulf', :moveable, [[748, 651, '#122F5B'], [778, 669, '#122F5B']])

@any_ship = ScreenObject.new('any_ship', :ads_dy, [[360, 336 + @ads_dy, '#22C901'], [468, 365 + @ads_dy, '#1A9402'], [360, 336 + @ads_dy, '#007DF1'], [468, 365 + @ads_dy, '#006DD3']], :partial)
@free_ship = ScreenObject.new('free_ship', :ads_dy, [[360, 336 + @ads_dy, '#007DF1'], [468, 365 + @ads_dy, '#006DD3']])
@captain_field = ScreenObject.new('captain_field', :ads_dy, [[500, 364 + @ads_dy, '#FFD700'], [533, 372 + @ads_dy, '#FFD700']])

@super_ship = ScreenObject.new('super_ship', :ads_dy,
  [
   # [206, 358 + @ads_dy, '#FEFEFE'],
   # [207, 356 + @ads_dy, '#F8F7F9'],
   # [210, 352 + @ads_dy, '#FFFFFF'],
   [236, 338 + @ads_dy, '#F8F7F9'],
   [236, 338 + @ads_dy, '#F8F7F9'],
   [236, 333 + @ads_dy, '#F8F7F9'],
   [232, 339 + @ads_dy, '#F8F7F9'],
   [233, 340 + @ads_dy, '#F8F7F9'],

 ])

@more_than_1k_sailors = ScreenObject.new('more than 1k sailors', :fixed,
  [
    [1548, 228, '#FBFFFF'],
    [1547, 234, '#FBFFFF'],
    [1550, 234, '#FBFFFF'],
    [1550, 230, '#FBFFFF'],
    [1552, 238, '#FBFFFF']
  ], :partial)
@skip_small_town_times = 0


def main_circle
  fail_unless_global_position
  fail_unless_global_position unless wait_for(@free_ship)
  enough_sailors = wait_for(@more_than_1k_sailors)


  # its_super_ship = check_any_area_colors(@super_ship, true)

  dputs 'разгрузили корабль'
  sleep_move_and_click(@free_ship)

  remove_captain_if_needed

  dputs 'выбрали его'
  sleep_move_and_click(@free_ship)

  # if its_super_ship
    # dputs 'super_ship to small_town'
    # small_town_run
    # return
  # end

  # return if excavation_run
  return if library_run

  return if market_run

  @skip_small_town_times = 15 unless enough_sailors

  if enough_sailors && (@skip_small_town_times <= 0) && (rand(100) > 30)
    small_town_run
  else
    gulf_run
    @skip_small_town_times -= 1
  end
  sleep(1)
end

def run
  # set_dxy
  10_000.times do |i|
    dputs "#{Time.now} Цикл #{i}"
    main_circle
  end
end

def fail_unless_global_position
  check_points = [@market, @gulf, @any_ship]

  mouse_free
  check_points.each do |check_point|
    raise_unless_area(check_point)
  end
end

