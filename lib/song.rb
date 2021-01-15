require_relative './artist'
require_relative './mp3_importer'

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def self.new_by_filename(file)
        artist_str = file.split(" - ")[0]
        title = file.split(" - ")[1]
        song = Song.new(title)
        artist = Artist.new(artist_str)
        artist_name = artist
        song.name = title
        song.artist = artist_name
        # binding.pry
        song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        self.artist = artist
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end
