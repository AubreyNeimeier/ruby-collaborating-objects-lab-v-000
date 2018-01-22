class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def songs
    #@@songs << Song.artist_name = self
    @songs
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    #self.all.find {|artist| artist.name == name} || Artist.new(name).tap { |art| art.save }
    self.all.find {|artist| artist.name == name} || self.create(name)
  end

  def self.create(name)
    song = self.new(name)
    song.tap {|x| x.save}
  end

  def self.all
    @@all
  end

  def print_songs
    @songs.each do |x|
      puts x.name
    end
  end

end
