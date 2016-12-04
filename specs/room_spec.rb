require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class RoomSpec < MiniTest::Test

  def setup()
    @room = Room.new(20)
    @nina = Guest.new("Nina", 9)
    @song = Song.new("Africa", "Toto")
    @sarah = Guest.new("Sarah", 200, @song)
  end 

  def test_get_price()
    assert_equal(20, @room.price())
  end

  def test_check_in_guests()
    @room.check_in_guest(@sarah)
    assert_equal(1, @room.number_of_guests())
  end

  def test_check_out_guests()
    @room.check_in_guest(@sarah)
    @room.check_out_guest(@sarah)
    assert_equal(0, @room.number_of_guests())
  end

  def test_check_out_guests_that_isnt_in_room()
    @room.check_in_guest(@sarah)
    assert_equal("Guest could not be found in this room.", @room.check_out_guest(@nina))
  end

  def test_add_song_to_playlist()
    @room.add_song_to_playlist(@song)
    assert_equal(1, @room.number_of_songs())
  end

  def test_delete_song_from_playlist()
    @room.add_song_to_playlist(@song)
    @room.delete_song_from_playlist(@song)
    assert_equal(0, @room.number_of_songs())
    assert_equal([], @room.playlist())
  end

  def test_print_out_playlist()
    @room.add_song_to_playlist(@song)
    @room.print_playlist
  end

  def test_cheering()
    @room.add_song_to_playlist(@song)
    assert_equal("Whoo!", @room.check_in_guest(@sarah))
  end

  def test_full_capacity()
    full_room = Room.new(30,1)
    full_room.check_in_guest(@sarah)
    assert_equal("This room has reached full capacity.", full_room.check_in_guest(@nina))
  end

  def test_pay_for_room()
    @room.check_in_guest(@sarah)
    assert_equal(180, @sarah.cash())
  end

  def test_income()
    @room.check_in_guest(@sarah)
    assert_equal(20, @room.income())
  end

  def test_insufficient_funds()
    assert_equal("Insufficient funds.", @room.check_in_guest(@nina))
  end

end
