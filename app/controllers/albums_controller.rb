class AlbumsController < ApplicationController
  before_action :authenticate_user!

  def index
    @albums = @current_user.albums
  end

  def create
    @album = Album.create(permitted_params)
    @current_user.albums << @album

    redirect_to albums_path
  end

  def destroy
    album = @current_user.albums.find(params[:id])
    album.destroy

    redirect_to user_albums_path
  end

  private

  def permitted_params
    params.require(:album).permit(:user_id, :title)
  end
end
