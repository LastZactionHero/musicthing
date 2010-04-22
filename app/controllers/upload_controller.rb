class UploadController < ApplicationController
  def index
  end

  def uploadFile
    post = DataFile.save( params[:upload] )
  end

end
