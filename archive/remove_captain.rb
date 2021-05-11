def remove_captain_if_needed
  return if check_all_area_colors(:captain_field)

  dputs 'убрать капитана'
  sleep_move_and_click(:captain_field)
  sleep(0.5)
  sleep_move_and_click(:captain_remove_button)
end