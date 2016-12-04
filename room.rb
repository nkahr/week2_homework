require_relative('guest.rb')
require_relative('venue.rb')


class Room 

  attr_reader :number_of_guests, :number_of_songs, :capacity, :price, :income, :playlist

  def initialize(price, capacity = false)
    @price = price
    @number_of_guests = 0 
    @guests = []
    @number_of_songs = 0
    @playlist = []
    @capacity = capacity
    @income = 0
  end

  def check_in_guest(guest)
    if @capacity && @capacity <= @number_of_guests
      message = "This room has reached full capacity."
      puts message 
      return message
    elsif guest.cash() < @price
      message = "Insufficient funds."
      puts message
      return message
    else
      @number_of_guests += 1 
      @guests.push(guest)
      guest.cash -= @price
      @income += @price
      if @playlist.include?(guest.favourite_song())
        guest.cheer()
      end
    end
  end

  def check_out_guest(guest)
    if @guests.include?(guest)
      @number_of_guests -= 1
      @guests.delete(guest)
    else 
      message = "Guest could not be found in this room."
      puts message
      return message
    end 
  end 

  def add_song_to_playlist(song)
    @playlist.push(song)
    @number_of_songs += 1 
  end

  def delete_song_from_playlist(song)
    @playlist.delete(song)
    @number_of_songs -= 1
  end

  def print_playlist()
    for song in @playlist
      message = "#{song.name()} by #{song.artist()}"
      puts message
      return message
    end
  end

end 
