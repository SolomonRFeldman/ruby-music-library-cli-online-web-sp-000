class Song
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end
  
  def save
    @@all << self
    self
  end
  
  def artist=(artist)
    @artist = artist
    if artist != nil
      artist.add_song(self)
    end
  end
  
  def genre=(genre)
    @genre = genre
    if genre != nil
      genre.add_song(self)
    end
  end
  
  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).save
  end
  
  def self.new_from_filename(filename)
    fileinfo = filename.delete(//)split(" - ")
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end