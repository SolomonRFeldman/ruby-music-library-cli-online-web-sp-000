class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    command = gets
    while command != "exit"
      puts "What would you like to do?"
      command = gets
    end
  end
  
  def list_songs
    song_count = 0
    Song.all.sort { |song_a, song_b| 
      song_a.name <=> song_b.name
    }.each { |song|
      song_count += 1
      puts "#{song_count}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
    }
  end
  
  def list_artists
    artist_count = 0
    Artist.all.sort { |artist_a, artist_b| 
      artist_a.name <=> artist_b.name
    }.each { |artist|
      artist_count += 1
      puts "#{artist_count}. #{artist.name}"
    }
  end
  
  def list_genres
    genre_count = 0
    Genre.all.sort { |genre_a, genre_b| 
      genre_a.name <=> genre_b.name
    }.each { |artist|
      artist_count += 1
      puts "#{artist_count}. #{genre.name}"
    }
  end
  
end