@log_file = File.open("log/seaport_#{Time.now.strftime('%Y-%m-%d_%H_%M_%S')}.log", 'w+')

def getmouselocation
  `xdotool getmouselocation`.split(' ')[0..1].map { |s| s.split(':')[1].to_i }
end

def dx(point_type = nil)
  @dx # + (point_type == :moveable ? @field_dx : 0)
end

def dy(point_type = nil)
  @dy #+ (point_type == :moveable ? @field_dx : 0) + (point_type == :ads_dy ? @ads_dy : 0)
end

def get_color(point, point_type = nil)
  draise 'no point' if !point || point[0].to_i.zero? || point[1].to_i.zero?
  # медленно работает, грузит видеосистему
  pixel_command = "/usr/bin/import -silent -window root -crop 1x1+#{point[0].to_i + dx(point_type)}+#{point[1].to_i + dy(point_type)} -depth 8 txt:-"
  `#{pixel_command}`.split(' ')[-2]
end

def xdomove(point, point_type = nil)
  `xdotool mousemove #{point[0] + dx(point_type)} #{point[1] + dy(point_type)} `
end

def mouse_click
  `xdotool click 1`
end

def printscreen
  `xdotool key 'Print'`
end

def draise(msg)
  dputs('-' * 10)
  dputs(msg.to_s)
  dputs('-' * 10)
  @log_file.close
  raise msg
end

def dputs(msg)
  puts msg.to_s
  @log_file.write(msg.to_s + "\n")
end
