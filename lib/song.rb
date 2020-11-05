require "pry"
require_relative "./artist.rb"

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        # binding.pry
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        # SWEET JESUS IT WORKS
        # Splits filemane into useable strings
        x = filename.split(" - ")
        # creates a new song with name from filename and assigns it to variable
        new_song = self.new(x[1])
        # sets the artist name to equal the artist from filename using the instance method 'artist_name='
        new_song.artist_name=(x[0])
        # returns the newly created song
        new_song
        
    end

    def artist_name=(name)
        # basically tells the instance of Song to associate itself with an artists name we supply
        # sets the surrent artist to the result of the .find_or_create_by_name Artist method
        self.artist = Artist.find_or_create_by_name(name)
        # calls the Artist.add_song method with a value of itself to tell the artist to associate the song with itself
        artist.add_song(self)
    end 


end