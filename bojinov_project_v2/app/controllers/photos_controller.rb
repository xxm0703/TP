class PhotosController < ApplicationController
  def serve
    photo = Photo.find(params[:id])
    send_data(photo.data, type: photo.mime_type, filename: photo.filename, disposition: :inline)
  end
end
