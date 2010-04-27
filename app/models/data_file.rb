require 'net/ftp'
require 'mp3info'

class DataFile < ActiveRecord::Base

  class FileTags
    attr_accessor :title, :artist, :album
	
	def initialize( title, artist, album )
	  @title = title
	  @artist = artist
	  @album = album
	end
	
  end
  
  def self.save(upload)
  
    # Get filename
	upload_filename = upload['datafile'].original_filename
	
	# Replace spaces with '-'
	upload_filename = upload_filename.gsub( / /, '-' )
	
	# Prefix song name with database index number
	upload_filename = Song.all.size.to_s + upload_filename
	
    # Create Tempfile of upload
    tempfile = Tempfile.new( 'music_file_upload' )
	tempfile.puts upload['datafile'].read
	
	# Exract Tag Data
	song_tags = extract_mp3_tags( tempfile.path )
	
	# Upload to ftp server
	upload_to_ftp( tempfile.path , upload_filename )
	
	# Add database entry
	@song = Song.new()
	@song.title = song_tags.title
	@song.artist = song_tags.artist
	@song.album = song_tags.album
	@song.filename = "http://www.allweapons.net/musicthing/#{upload_filename}"
	@song.save
	
	# Clean up
	tempfile.close
	
  end

  def self.extract_mp3_tags( input_filename )
  
	mp3 = Mp3Info.open( input_filename )
	return FileTags.new( mp3.tag.title, mp3.tag.artist, mp3.tag.album )
  
  end
  
  def self.upload_to_ftp( input_filename, output_filename )
	
    # Connect to FTP
    ftp = Net::FTP.new
    puts ftp.connect( 'ftp.allweapons.net', 21 )
    ftp.login( 'zdicklin', 'foxForce5' )
    ftp.passive = true
	puts ftp.chdir( 'musicthing' )
	
	puts ftp.putbinaryfile( input_filename, output_filename )
	
    puts ftp.close
  end
  
end
