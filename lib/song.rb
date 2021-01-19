require 'pry'

class Song
    @@all = []

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        name = file_name.split(" - ")[0]
        song = file_name.split(" - ")[1]

        new_song = Song.new(song)
        new_song.artist_name = name
        new_song
    end

    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        @artist = artist
    end
end