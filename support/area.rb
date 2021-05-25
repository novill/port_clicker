require_relative 'externals'

MAX_COLOR_DELTA = 16

ScreenObject = Struct.new(:name, :move_type, :points, :check_type)

def check_area_colors(screen_object, quite = false)
  if screen_object.check_type == :partial
    check_any_area_colors(screen_object, quite)
  else
    check_all_area_colors(screen_object, quite)
  end
end

def check_all_area_colors(screen_object, quite = false)
  screen_object.points.all? { |p| check_color(p, quite) }
end

def check_any_area_colors(screen_object, quite = false)
  screen_object.points.any? { |p| check_color(p, quite) }
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

def random_area_point(screen_object)
  safe_xy = 3
  area = screen_object.points
  return screen_object.points[0] if screen_object.points.size == 1

  xx = [area[0][0], area[1][0]].sort
  yy = [area[0][1], area[1][1]].sort
  [rand((xx[0] + safe_xy)..(xx[1] - safe_xy)) || xx[0], rand((yy[0] + safe_xy)..(yy[1] - safe_xy)) || yy[0]]
end

def get_colors(screen_object)
  screen_object.points.map { |p| get_color(p) }
end

def raise_unless_area(screen_object)
  return if check_area_colors(screen_object, true)

  logged_sleep(3)
  printscreen
  if screen_object.name == 'any_ship'
    dputs("any_ship double wait")
    logged_sleep(3)
  end
  unless check_area_colors(screen_object, false)
    printscreen
    draise "No #{screen_object.name} #{get_colors(screen_object)}"
  end
end
