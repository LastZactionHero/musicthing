class SongsController < ApplicationController
  # GET /songs
  # GET /songs.xml
  def index
    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.xml
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.xml
  def new
    @song = Song.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @song }
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
  end

  # POST /songs
  # POST /songs.xml
  def create
    @song = Song.new(params[:song])

    respond_to do |format|
      if @song.save
        flash[:notice] = 'Song was successfully created.'
        format.html { redirect_to(@song) }
        format.xml  { render :xml => @song, :status => :created, :location => @song }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.xml
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        flash[:notice] = 'Song was successfully updated.'
        format.html { redirect_to(@song) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.xml
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to(songs_url) }
      format.xml  { head :ok }
    end
  end
  
  def view_playlist
	#@songs = Song.all
	#@current_track_filename = ""
	#if session[:current_track] >= 0 and session[:current_track] < @songs.size
	#	@current_track_filename = @songs[session[:current_track]].filename
	#end
	#
	#puts "current track: #{@current_track_filename}\n"
  end
  
  def set_track
	session[:current_track] = params[:id].to_i
	redirect_to :action => "view_playlist"
  end
 
  def upload
    redirect_to :action => "view_playlist"
  end
 
  def upload_form

  end
    
  def generate_playlist
  
	session[:current_track] = params[:id].to_i

	@songs = Song.all
	
	@current_track_filename = ""
	if session[:current_track] >= 0 and session[:current_track] < @songs.size
		@current_track_filename = @songs[session[:current_track]].filename
	end
	
	puts "current track: #{@current_track_filename}\n"
  end
  
  def generate_player
	track_idx = params[:id].to_i
	
	@songs = Song.all
	
	@current_track_filename = ""
	if track_idx >= 0 and track_idx < @songs.size
		@current_track_filename = @songs[track_idx].filename
	end
	
	puts "current track: #{@current_track_filename}\n"
  end
  
end
