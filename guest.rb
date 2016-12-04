require_relative('room')
require_relative('venue')

class Guest 

  attr_reader :name
  attr_accessor :favourite_song, :cash

  def initialize(name, cash, favourite_song = nil)
    @name = name
    @cash = cash 
    @favourite_song = favourite_song 
  end

  def cheer()
    message = "Whoo!"
    puts message
    return message
  end

end
