require_relative 'area'

FIRST_WAIT = 5
WAIT_INCREASE = 5
MAX_WAIT = 20

def wait_for_all(area, comment = '')
  return true if check_all_area_colors(area, false)

  until check_all_area_colors(, false, true)
    dputs "#{Time.now} #{comment}"
    waiter = FIRST_WAIT
    logged_sleep(waiter)
    waiter += WAIT_INCREASE if waiter <= MAX_WAIT
  end
  false
end

def wait_for_any(area, comment = '')
  return true if check_any_area_colors(area, false, true)

  waiter = FIRST_WAIT
  until check_any_area_colors(area, false, true)
    dputs "#{Time.now} #{comment}"
    logged_sleep(waiter)
    waiter += WAIT_INCREASE if waiter <= MAX_WAIT
  end
  false
end

def logged_sleep(seconds)
  return sleep(seconds) if seconds <= 5

  dputs "sleep for #{(sleep_time)}"

  sleep_time.to_i.times do |i|
    sleep 1
    dputs "sleep for #{(sleep_time - i)}" if (i % 5 == 0)

      if i > sleep_time - 6 && i.odd?
        s = (sleep_time - i).to_s
        dputs "#{s * 30}\n" * 5
      end

    end
end
