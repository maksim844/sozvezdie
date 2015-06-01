class PicturealbumsController < ApplicationController
  def index
    @albums = Node.where("url like '%#{request.fullpath[1..request.fullpath.length]}%'").first().albums
  end

  def show
    @title = Album.find(params[:id]).name
    @photos = Photo.where(album_id: params[:id])
  end
end
