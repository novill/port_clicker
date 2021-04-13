require_relative 'support'

@old_point = nil

def sleep_move_and_click(area)
  sleep_to
  mouse_move(area)
  mouse_click
end

def mouse_move(to)
  xto = area_point(to)
  # xto = to[0]
  xdomove(xto) # TODO: имитируем движение мыши
  @old_point = xto
end

def wait_for(area, comment = '')
  draise 'bad area' unless area?(area)

  return true if check_area_colors(area, false, true)

  waiter = 5
  until check_area_colors(area, false, true)
    dputs "#{Time.now} #{comment}"
    sleep_to(from: waiter, to: waiter)
    waiter += 5 if waiter <= 20
  end
  false
end

def wait_for_any(area, comment = '')
  return true if check_any_area_colors(area, false, true)

  waiter = 5
  until check_any_area_colors(area, false, true)
    dputs "#{Time.now} #{comment}"
    sleep_to(from: waiter, to: waiter)
    waiter += 5 if waiter <= 20
  end
  false
end

def sleep_to(from: 0.5, to: 0.7)
  sleep_time = rand(from..to)
  if sleep_time.to_i > 5
    sleep_time.to_i.times do |i|
      if sleep_time > 15 && i > sleep_time - 8 && i.odd?
        s = (sleep_time - i).to_s
        dputs "#{s * 30}\n" * 5
      else
        dputs "sleep for #{(sleep_time - i)}" if (i % 5 == 0) || ((sleep_time - i) <= 5)
      end
      sleep 1
    end
  else
    sleep(sleep_time)
  end
end
