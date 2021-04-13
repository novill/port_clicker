MOUSE_SLEEP_MIN = 0.5
MOUSE_SLEEP_MAX = 0.7

DY = 0 # 27
DX = 0

def getmouselocation
  `xdotool getmouselocation`.split(' ')[0..1].map { |s| s.split(':')[1].to_i }
end

def get_color(point)
  draise 'no point' if !point || point[0].to_i.zero? || point[1].to_i.zero?
  # медленно работает, грузит видеосистему
  pixel_command = "/usr/bin/import -silent -window root -crop 1x1+#{point[0].to_i - DX}+#{point[1].to_i - DY} -depth 8 txt:-"
  `#{pixel_command}`.split(' ')[-2]
end

def xdomove(point)
  `xdotool mousemove #{point[0] + DX} #{point[1] + DY} `
end

def mouse_click
  `xdotool click 1`
end

def draise(msg)
  dputs('-'*10)
  dputs(msg)
  dputs('-'*10)
  @log_file.close
  raise msg
end

def dputs(msg)
  puts msg
  @log_file.write(msg + "\n")
end