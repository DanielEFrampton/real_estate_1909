require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
    @room_3 = Room.new(:living_room, 25, 15)
    @room_4 = Room.new(:basement, 30, 41)
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_it_initializes_with_price_address_and_empty_rooms_array
    assert_equal "$400000", @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal [], @house.rooms
  end

  def test_it_can_add_room_to_rooms_array
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_it_can_return_array_of_rooms_from_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_1, @room_2], @house.rooms_from_category(:bedroom)
    assert_equal [@room_3], @house.rooms_from_category(:living_room)
    assert_equal [@room_4], @house.rooms_from_category(:basement)
  end

  def test_it_can_return_total_area_of_all_rooms_in_house
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal (@room_1.area + @room_2.area), @house.area
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal (@room_1.area + @room_2.area + @room_3.area + @room_4.area), @house.area
  end

  def test_it_can_return_price_per_square_foot_of_itself
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    price_int = @house.price.to_i
    price_per_foot = price_int / @house.area

    assert_equal price_per_foot, @house.price_per_square_foot
  end

  def test_it_can_return_array_of_rooms_sorted_by_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    rooms_by_area = @house.rooms.sort_by {|room| -room.area}

    assert_equal rooms_by_area, @house.rooms_sorted_by_area
  end

  def test_it_can_return_hash_of_rooms_by_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    rooms_by_cat = @house.rooms.group_by {|room| room.category}

    assert_equal rooms_by_cat, @house.rooms_by_category
  end

end
