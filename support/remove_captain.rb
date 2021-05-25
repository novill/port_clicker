@captain_field = ScreenObject.new(
    'captain_field',
    :fixed,
    [[500, 350, '#FFD700'], [533, 350, '#FFD700']]
)

@captain_remove_button = ScreenObject.new(
    'captain_remove_button',
    :fixed,
    [[1159, 454, ''], [1264, 469, '']]
)

def remove_captain_if_needed
  return unless check_all_area_colors(@captain_field, true)

  dputs 'убрать капитана'
  sleep_move_and_click(@captain_field)
  mouse_free
  sleep_move_and_click(@captain_remove_button)
end