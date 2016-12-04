class Venue 

  attr_reader :name, :number_of_rooms, :rooms_array

  def initialize(name)
    @name = name
    @number_of_rooms = 0
    @rooms_array = []
  end 

  def add_room(room)
    @number_of_rooms += 1
    @rooms_array.push(room)
  end

end 