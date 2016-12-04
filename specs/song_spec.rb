require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')


class SongSpec < MiniTest::Test 

  def setup()
    @song = Song.new("Juicy")
  end

  def test_get_song_name()
    assert_equal("Juicy", @song.name())
  end

end
