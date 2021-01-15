require 'pry'
require_relative './song'
require_relative './mp3_importer'

class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        exists = Artist.all.find { |artist| artist.name }
        exists ? exists : Artist.new(name)
    end

    def print_songs
        Song.all.each { |song| puts song.name if song.artist == self }
    end

    def save
        @@all << self
    end

    def songs
        Song.all.select { |song| song.artist == self }
    end

    def self.all
        @@all
    end
end