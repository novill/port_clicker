require_relative 'externals'
require_relative 'wait_and_move'

MAX_COLOR_DELTA = 16

def check_all_area_colors(point_list_name, do_sleep = true, quite = false)
  P[point_list_name].all? { |p| check_color(p, quite) }
end

def check_any_area_colors(point_list_name, do_sleep = true, quite = false)
  P[point_list_name].any? { |p| check_color(p, quite) }
end

def check_color(point, quite = false)
  screen_color = get_color(point)
  p_color = point[2]
  res = (screen_color[1] == p_color[1] && screen_color[3] == p_color[3] && screen_color[5] == p_color[5])
  unless res
    unless quite
      dputs "неуспешная проверка точки #{point}"
      dputs "Заданный цвет __#{p_color}__"
      dputs "Экранный цвет __#{screen_color}__"
    end
  end
  res
end

def similar_color(color1, color2)
  rgb16 = [[color1[1..2], color2[1..2]],
           [color1[3..4], color2[3..4]],
           [color1[5..6], color2[5..6]]
          ]

  rgb1.all?{ |s2color| similar_simple_color(s2color)
end

def similar_simple_color(s2color)
  (s2color[0].to_i(16) - s2color[1].to_i(16)).abs < MAX_COLOR_DELTA
end

def random_area_point(area)
  xx = [area[0][0], area[1][0]].sort
  yy = [area[0][1], area[1][1]].sort
  [rand(xx[0]..xx[1]), rand(yy[0]..yy[1])]
end

def raise_unless_area(area, area_name)
  unless check_area_colors(area, false, false)
    sleep_to
    draise "No #{area_name} #{get_colors(area)}" unless check_area_colors(area, false, false)
  end
end

def get_colors(points)
  (area?(points) ? points : [points]).map { |p| [p, get_color(p)] }
end

def print_colors(points)
  pp get_colors(points)
end

# #263B48
# #122F5B
# 1397
# 353
# #263B48
# #122F5B
