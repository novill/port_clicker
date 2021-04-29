require_relative 'area'

FIRST_WAIT = 5
WAIT_INCREASE = 5
MAX_WAIT = 20

def wait_for_all(area_name)
  return true if check_all_area_colors(area_name, true)

  waiter = FIRST_WAIT
  until check_all_area_colors(area_name, true)
    dputs "#{Time.now} #{area_name}"
    logged_sleep(waiter)
    waiter += WAIT_INCREASE if waiter <= MAX_WAIT
  end
  false
end

def wait_for_any(area, comment = '')
  return true if check_any_area_colors(area, true)

  waiter = FIRST_WAIT
  until check_any_area_colors(area, true)
    dputs "#{Time.now} #{comment}"
    logged_sleep(waiter)
    waiter += WAIT_INCREASE if waiter <= MAX_WAIT
  end
  false
end

def logged_sleep(seconds = 1)
  return sleep(seconds) if seconds <= 5

  dputs "sleep for #{seconds}"

  seconds.to_i.times do |i|
    sleep 1
    dputs "sleep for #{(seconds - i)}" if i % 5 == 0
    if i > seconds - 6 && i.odd?
      s = (seconds - i).to_s
      dputs "#{s * 30}\n" * 5
    end
  end
end
