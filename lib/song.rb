require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # class methods
  def self.all
    @@all
  end

  def self.create
    s = self.new
    s.save
    s
  end

  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.new
    s.name = name
    s.save
    s
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)

    if !(found)
      self.create_by_name(name)
    else
      return found
    end
  end

  def self.alphabetical
    @@all.sort{|a, b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    # filename format: "artist_name - song_name.extension"

    # splits the string into an array: the artist name, and the song followed by the extension
    ary = filename.split(' - ')
    # splits the song name from the extension and merges the two arrays
    ary = ary | ary.pop.split('.')

    s = self.new
    s.artist_name = ary[0]
    s.name = ary[1]

    s
  end

  def self.create_from_filename(filename)
    # filename format: "artist_name - song_name.extension"

    # splits the string into an array: the artist name, and the song followed by the extension
    ary = filename.split(' - ')
    # splits the song name from the extension and merges the two arrays
    ary = ary | ary.pop.split('.')

    s = self.new
    s.artist_name = ary[0]
    s.name = ary[1]
    s.save

    s
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

end
