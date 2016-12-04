require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')


class GuestSpec < MiniTest::Test

  def setup()
    @believe = Song.new("Believe", "Cher")
    @harrie = Guest.new("Harrie", 2000, @believe)
    @bohemian_rhapsody = Song.new("Bohemian Rhapsody", "Queen")
    @lisa = Guest.new("Lisa", 90)
  end

  def test_get_guest_name()
    assert_equal("Lisa", @lisa.name)
  end

  def test_get_favourite_song()
    assert_equal(@believe, @harrie.favourite_song())
  end

  def test_add_favourite_song()
    assert_equal(nil, @lisa.favourite_song())
    @lisa.favourite_song = @bohemian_rhapsody
    assert_equal(@bohemian_rhapsody, @lisa.favourite_song())
  end

  def test_cheering()
    assert_equal("Whoo!", @harrie.cheer())
  end

end