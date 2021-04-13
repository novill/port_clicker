#! ruby

DEBUG = true

require_relative 'externals'
require_relative 'support'
require_relative 'wait_and_move'
require_relative 'construction_site_run'
require_relative 'fisher_run'
require_relative 'market_run'
require_relative 'small_town_run'
require_relative 'gulf_run'

# @ = [[0, 0, '#0'], [0, 0, '#0']]
POINTS = {
  general_goods: [[1000, 275, '#122F5B'], [1033, 297, '#122F5B']],
  empty_space: [[790, 389], [810, 418]],
  busy_ship: [[358, 447, '#22C901'], [472, 477, '#1A9402']],
  free_ship: [[358, 447, '#007DF1'], [472, 477, '#006DD3']],
  sailors: [[1548, 228, '#FBFFFF'], [1547, 234, '#FBFFFF'], [1550, 234, '#FBFFFF'], [1550, 230, '#FBFFFF']],
  market: [[1254, 580, '#122F5B'], [1284, 604, '#122F5B']],
  small_town: [[1151, 670, '#122F5B'], [1181, 692, '#122F5B']],
  gulf: [[856, 580, '#122F5B'], [886, 603, '#122F5B']],
  port: [[1793, 800, '#293658'], [1859, 809, '#283658']],
  grove: [[1168, 440, '#122F5B'], [1200, 463, '#122F5B']],
  yoga_shop: [[1355, 216, '#26375D'], [1383, 216, '#28385D']],
  yoga_shop_ok_button: [[977, 644, '#0079F8'], [1115, 708, '#0062C9']],
  store_full_form: [[792, 342, '#E90046'], [1158, 400, '#E90046']],
  store_full_ok_button: [[908, 642, '#0079F8'], [1049, 710, '#0079F8']],

  local_craftsman: [[1331, 442, '#263B48'], [1362, 459, '#263B48']],
  coffee_plantation: [[1369, 332, '#122F5B'], [1397, 353, '#122F5B']],
  big_ok_small_town_button: [[977, 644, '#0079F8'], [1110, 708, '#0061C8']]

}

@log_file = File.open("seaport_#{Time.now.strftime('%Y-%m-%d_%H_%M_%S')}.log", 'w+')

def run
  #
  puts check_area_colors(POINTS[:yoga_shop])
  puts check_area_colors(POINTS[:local_craftsman])
  puts check_area_colors(POINTS[:coffee_plantation])

  # puts get_colors(POINTS[:coffee_plantation])

  # xdomove(@small_town[0])
  # sleep(5)
  # xdomove(@small_town[1])
  exit

  # 10_000.times do |i|
  #   dputs "Цикл #{i}"
  #   main_circle
  # end
end

def main_circle
  fail_unless_global_position

  fail_unless_global_position unless wait_for(@free_ship, 'подождать свободный корабль')
  enough_sailors = wait_for_any(@sailors, 'подождать свободных матросов (от тысячи)')

  @wheelbarrow_ship = check_color(@wheelbarrows_on_ship, true)

  # dputs "корабль #{@wheelbarrow_ship ? '' : 'не'} с тачками "

  dputs 'разгрузили корабль'
  sleep_move_and_click(@free_ship)
  @market_no_wheelbarrow = false if @wheelbarrow_ship

  dputs 'выбрали его'
  sleep_move_and_click(@free_ship)

  @big_ship = check_area_colors(@construction_site, true, true)

  if construction_site_decider
    dputs 'отправляем набирать тачки'
    return if construction_site_run
  end

  dputs 'отправляем продавать тачки'
  unless @market_no_wheelbarrow
    return if market_run
  end

  dputs 'если набирать тачки и продавать не стали, отправить корабль за золотом'
  if enough_sailors && @big_ship  && rand(10) > 5
    dputs 'в small_town'
    small_town_run
  else
    dputs 'в Gulf'
    gulf_run
  end
end

def fail_unless_global_position
  mouse_move(@empty_space)
  sleep_to
  raise_unless_area(@general_goods, 'general_goods')
  draise 'no ship button' unless check_area_colors(@busy_ship, false, true) || check_area_colors(@free_ship, false, true)

  raise_unless_area(@small_town, 'small_town')
  raise_unless_area(@market, 'market')
  # raise_unless_area(@port_button, 'port_button')
  raise_unless_area(@gulf, 'gulf')
end

run
