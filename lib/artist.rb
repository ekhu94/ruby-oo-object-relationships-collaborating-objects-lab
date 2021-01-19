class Artist
    @@all = []

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        self.all.find { |artist| artist.name == name } || Artist.new(name)
    end

    attr_accessor :name

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select { |song| song.artist == self }
    end

    def print_songs
        Song.all.each { |song| puts song.name if song.artist == self }
    end
end