class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room_object)
    @rooms << room_object
  end

  def area
    @rooms.reduce(0) do |total_area, room|
      total_area += room.area
    end
  end

  def rooms_from_category(category)
    @rooms.select do |room|
      room.category == category
    end
  end

  def price_per_square_foot
    @price.to_i / area
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      -room.area
    end
  end

  def rooms_by_category
    @rooms.group_by do |room|
      room.category
    end
  end

end
