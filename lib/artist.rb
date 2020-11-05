require "pry"
require_relative "./song.rb"



class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        # returns all songs associated with artist

        # iterates through all of the created songs in the song class
        # uses #select to generate and return a new array
        Song.all.select do |song|
            # returns the song if the song's artist is equal to the current artist (self)
            # since we're using #select, when something is returned it is added to the array
            song.artist == self
        end
    end

    def add_song(new_song)
        # adds itself as the artist to an existing song
        # I don't think this one handles any exceptions if the song doesnt exist, but it still passes the tests so I'm not gonna touch it
        new_song.artist = self
        
    end

    def self.find_or_create_by_name(name)

        if self.all.find {|artist| artist.name == name}
            self.all.find {|artist| artist.name == name}
        else
            self.new(name)
        end
    
        # if @@all = []
            
        #     new_artist = Artist.new(mystery_name)
        # else
            
        #     @@all.each do |artist|
                
        #         if artist.name == mystery_name
                    
        #             artist
        #         end
        #     end
        # end
    end

    def print_songs
        # prints all songs associated with current artist to the terminal

        # generates a new array to store matching songs
        songs_list = []
        # iterates through all of the songs stored in the Song class
        Song.all.each do |song|
            # checks if the song's artist matches the current instance (self)
            if song.artist == self
                # if it does, song's name gets shoveled into the array we created
                # otherwise, nothing happens and we move on to the next item in the Song.all array
                songs_list << song.name
            end
        end
        # prints the array to the console
        puts songs_list
    end
    

end