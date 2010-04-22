class UploadController < ApplicationController
  def index
  end

  def uploadFile
    post = DataFile.save( params[:upload] )
	
	redirect_to :controller => "songs", :action => "view_playlist"
  end

end
