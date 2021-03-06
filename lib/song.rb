class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    parsed_filename = filename.split(" - ")
    title = parsed_filename[1]
    artist = parsed_filename[0]
    new_song = self.new(title)
    new_song.artist_name = artist
    new_song
  end

  def artist_name=(name)
    new_artist = Artist.find_or_create_by_name(name)
    self.artist = new_artist
    new_artist.add_song(self)
  end
end
