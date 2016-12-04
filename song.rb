class Song

  attr_reader :name, :artist

  def initialize(name, artist = "unknown")
    @name = name
    @artist = artist 
  end

end 