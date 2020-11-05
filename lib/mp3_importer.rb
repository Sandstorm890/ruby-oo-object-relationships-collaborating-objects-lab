require "pry"
require_relative "./song.rb"
require_relative "./artist.rb"




class MP3Importer

    attr_accessor :path

    
    def initialize(files)
        @files = files
        @path = "./spec/fixtures/mp3s"
    end

    def files
       Dir.chdir(@path) {|path| Dir.glob("*.mp3")}
    end

    def import 
        files.each do |file|
            Song.new_by_filename(file)
        end
    end
end