require_relative 'area'

MOUSE_SLEEP_MIN = 0.5
MOUSE_SLEEP_MAX = 0.7

@old_point = nil

def sleep_move_and_click(area_name)
  mouse_sleep
  mouse_move(area_name)
  mouse_click
end

def mouse_move(area_name)
  xto = random_area_point(area_name)
  xdomove(xto)
  @old_point = xto
end

def mouse_sleep
  sleep(rand(MOUSE_SLEEP_MIN..MOUSE_SLEEP_MAX))
end
