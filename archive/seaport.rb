#! ruby

require_relative 'support/game_points'
require_relative 'support/mouse_move'
require_relative 'support/wait_and_sleep'
require_relative 'support/area'
require_relative 'runners/yoga_shop_run'
require_relative 'runners/market_run'
require_relative 'runners/small_town_run'
require_relative 'runners/gulf_run'
# require_relative 'runners/global_quest_run'
require_relative 'runners/remove_captain'
require_relative 'runners/merhant_maria_run'

@skip_small_town_times = 0

def init_mouse_delta
  dputs 'Ready to mouse location?'
  logged_sleep(10)
  m = getmouselocation
  dputs m.to_s
  s = POINTS[:oil_field][0]
  dputs s.to_s
  @dx = -(s[0] - m[0])
  @dy = -(s[1] - m[1])
  dputs "@dx=#{@dx} @dy=#{@dy}"

  dputs "check market = #{check_color(POINTS[:market], false )}"
end

def run
  10_000.times do |i|
    dputs "#{Time.now} Цикл #{i}"
    main_circle
  end
end

def main_circle
  fail_unless_global_position
  fail_unless_global_position unless wait_for_all(:free_ship)
  enough_sailors = wait_for_any(:sailors)

  @skip_small_town_times = 5 unless enough_sailors

  # @yoga_ship = check_all_area_colors(:yoga_ship, true)
  dputs 'разгрузили корабль'
  sleep_move_and_click(:free_ship)
  # remove_captain_if_needed
  dputs 'выбрали его'
  sleep_move_and_click(:free_ship)

  return if merchant_maria_run

  return if edgar_run

  if yoga_shop_decider
    dputs 'отправляем набирать yoga'
    return if yoga_shop_run
  end

  dputs 'отправляем продавать yoga'
  return if market_run

  dputs 'если набирать yoga и продавать не стали, отправить корабль за золотом'
  if enough_sailors && @skip_small_town_times <= 0
    dputs 'в small_town'
    small_town_run
  else
    @skip_small_town_times -= 1
    dputs 'в Gulf'
    gulf_run
  end
end

def fail_unless_global_position
  # checking_points = [:market, :small_town, :gulf, :oil_field, :yoga_shop, :any_ship]
  checking_points = %i[market small_town gulf any_ship]

  mouse_move(:empty_space)
  mouse_sleep
  checking_points.each do |check_point|
    raise_unless_area(check_point)
  end
end

