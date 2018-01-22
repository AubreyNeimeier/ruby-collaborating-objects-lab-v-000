generally speaking instance methods operate on a specific instance that already exists
while class methods either construct new instances (constructors), operate on the class as a whole (operators), or search the entire class (finders)

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
    #this is a class method. we call find or create by name on the artist class itself
    #the self within the class method refers to the class itself. its the same as saying
    #Artist.all.find.
  end

  def self.create(name) #class method
    song = self.new(name)
    #here self refers to Artist. same as Artist.new
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
