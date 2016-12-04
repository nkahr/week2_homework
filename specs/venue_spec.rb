require('minitest/autorun')
require('minitest/rg')
require_relative('../venue.rb')
require_relative('../room.rb')


class VenueSpec < MiniTest::Test 

  def setup()
    @venue = Venue.new('CCC')
    @room = Room.new(30)
  end

  def test_get_venue_name()
    assert_equal("CCC", @venue.name())
  end

  def test_add_room_to_venue()
    @venue.add_room(@room)
    assert_equal(1, @venue.number_of_rooms())
  end

end