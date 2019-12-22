require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new 
    @@all << song
    song
    # binding.pry
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
    # binding.pry
  end

  def self.find_by_name(song_name)
    self.all.detect do |song|
      song.name == song_name
      # binding.pry
    end 
  end
    
    def self.find_or_create_by_name(song_name)
      find_by_name(song_name) ? find_by_name(song_name) : create_by_name(song_name)
      
    end

    def self.alphabetical
      self.all.sort_by do |song|
        song.name
      end     
    end

    def self.new_from_filename(file_name)
     file = file_name.split(/[-.]/)
     song = Song.new
     song.name = file[1].strip
     song.artist_name = file[0].strip
     song
    #  binding.pry
    end

    def self.create_from_filename(file_name)
      file = file_name.split(/[-.]/)
      song = Song.new
      song.name = file[1].strip
      song.artist_name = file[0].strip
      @@all << song
    end

    def self.destroy_all
      Song.all.clear
    end
  

end
