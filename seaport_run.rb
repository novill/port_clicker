require_relative 'seaport'

def run
  10_000.times do |i|
    dputs "#{Time.now} Цикл #{i}"
    main_circle
  end
end

run