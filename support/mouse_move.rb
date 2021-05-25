require_relative 'area'

MOUSE_SLEEP_MIN = 0.5
MOUSE_SLEEP_MAX = 0.7

@old_point = nil
@empty_space = ScreenObject.new('empty_space', :moveable, [[555, 262], [747, 533]])

def sleep_move_and_click(screen_object)
  mouse_sleep
  mouse_move(screen_object)
  mouse_click
end

def mouse_free
  mouse_move(@empty_space)
  sleep(MOUSE_SLEEP_MAX * 2)
end

def mouse_move(screen_object)
  xto = random_area_point(screen_object)
  xdomove(xto)
  @old_point = xto
end

def mouse_sleep
  sleep(rand(MOUSE_SLEEP_MIN..MOUSE_SLEEP_MAX))
end
