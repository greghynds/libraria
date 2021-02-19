require 'minitest/autorun'
require_relative '../lib/app'

class MobTimerTest < Minitest::Test
  def test_rotation_time_is_eleven
    timer = MobTimer.new

    rotation_time = timer.rotation_time

    assert_equal(rotation_time, 11)
  end
end