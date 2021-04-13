#! ruby

DEBUG = true

require_relative 'runners/*'
require_relative 'support/*'
require_relative 'support'
require_relative 'wait_and_move'
require_relative 'construction_site_run'
require_relative 'fisher_run'
require_relative 'runners/market_run'
require_relative ']/nners/small_town_run'
require_relative 'gulf_run'

@log_file = File.open("seaport_#{Time.now.strftime('%Y-%m-%d_%H_%M_%S')}.log", 'w+')

def run
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

  if construction_site_decider
    dputs 'отправляем набирать тачки'
    return if construction_site_run
  end

  dputs 'отправляем продавать тачки'
  unless @market_no_wheelbarrow
    return if market_run
  end

  dputs 'если набирать тачки и продавать не стали, отправить корабль за золотом'
  if enough_sailors && @big_ship && rand(10) > 5
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
