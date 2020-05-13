class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500_000
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      category == room.category
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end

  def details
    {"price" => @price, "address" => @address}
  end

  def price_per_square_foot
    (@price.to_f / area.to_f).round(2)
  end
end
