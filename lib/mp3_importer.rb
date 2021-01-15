require 'pry'
require_relative './song.rb'
require_relative './artist.rb'

class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.children(@path)
    end

    def import
        files.map { |file| Song.new_by_filename(file) }
    end
end