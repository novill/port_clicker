require_relative 'externals'
require_relative 'game_points'

MAX_COLOR_DELTA = 16

def check_area_colors_by_name(point_list_name, quite = false)
  if point_list_name.to_s['any_']
    check_any_area_colors(point_list_name, quite)
  else
    check_all_area_colors(point_list_name, quite)
  end
end


def check_all_area_colors(point_list_name, quite = false)
  POINTS[point_list_name].select{ |p| p.instance_of?(Array) }.all? { |p| check_color(p, quite) }
end

def check_any_area_colors(point_list_name, quite = false)
  POINTS[point_list_name].select{ |p| p.instance_of?(Array) }.any? { |p| check_color(p, quite) }
end

def check_color(point, quite = false)
  fixed_color = point[2]
  return true unless fixed_color

  screen_color = get_color(point)
  res = similar_color(screen_color, fixed_color)
  unless res
    unless quite
      dputs "неуспешная проверка точки #{point.to_s}"
      dputs "Заданный цвет __#{fixed_color}__"
      dputs "Экранный цвет __#{screen_color}__"
    end
  end
  res
end

def similar_color(color1, color2)
  rgb16 = [[color1[1..2], color2[1..2]],
           [color1[3..4], color2[3..4]],
           [color1[5..6], color2[5..6]]]
  rgb16.all? { |s2color| similar_simple_color(s2color) }
end

def similar_simple_color(s2color)
  (s2color[0].to_i(16) - s2color[1].to_i(16)).abs < MAX_COLOR_DELTA
end

def random_area_point(point_list_name)
  safe_xy = 3
  area = POINTS[point_list_name]
  xx = [area[0][0], area[1][0]].sort
  yy = [area[0][1], area[1][1]].sort
  [rand((xx[0] + safe_xy)..(xx[1] - safe_xy)), rand((yy[0] + safe_xy)..(yy[1] - safe_xy))]
end

def get_colors(point_list_name)
  POINTS[point_list_name].map { |p| get_color(p) }
end

def raise_unless_area(area)
  return if check_area_colors_by_name(area, true)

  logged_sleep(3)
  printscreen
  if area == :any_ship
    dputs("any_ship double wait")
    logged_sleep(3)
  end
  unless check_area_colors_by_name(area, false)
    printscreen
    draise "No #{area} #{get_colors(area)}"
  end
end
