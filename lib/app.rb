class MobTimer
  attr_reader :rotation_time
  def initialize
    @rotation_time = 11
  end
end

puts "Rotation time: #{MobTimer.new.rotation_time}"
