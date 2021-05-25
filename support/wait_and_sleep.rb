require_relative 'area'

FIRST_WAIT = 3
WAIT_INCREASE = 3
MAX_WAIT = 25

def wait_for(screen_object)
  return true if check_area_colors(screen_object, true)

  waiter = FIRST_WAIT
  until check_area_colors(screen_object, true)
    dputs "#{Time.now} #{screen_object.name}"
    logged_sleep(waiter)
    waiter += WAIT_INCREASE if waiter <= MAX_WAIT
  end
  false
end

def logged_sleep(seconds = 1)
  return sleep(seconds) if seconds <= 5

  seconds.to_i.times do |i|
    remain = seconds - i
    sleep 1
    dputs "sleep for #{remain}" if (remain < 5) || (remain % 5 == 0)
  end
end
