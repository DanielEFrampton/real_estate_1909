require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'

class RoomTest < Minitest::Test

  def setup
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bathroom, 5, 8)
  end

  def test_it_exists
    assert_instance_of Room, @room_1
    assert_instance_of Room, @room_2
  end

  def test_it_initializes_with_category
    assert_equal :bedroom, @room_1.category
    assert_equal :bathroom, @room_2.category
  end

  def test_it_can_calculate_area_from_length_and_width
    assert_equal 130, @room_1.area
    assert_equal 40, @room_2.area
  end

end
