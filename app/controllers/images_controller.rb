class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_album

  def index
    @images = current_scope.images
  end

  def show
    @image = @current_user.images.find(params[:id])

    if turbo_frame_request?
      render partial: "tags/tags", locals: {
        image: @image,
        tags: @image.tags
      }
    end
  end

  def create
    @image = Image.create(permitted_params)
    @current_user.images << @image
    TagImageJob.perform_later(image_id: @image.id)

    redirect_for(@image)
  end

  def destroy
    image = @current_user.images.find(params[:id])
    image.destroy

    redirect_for(image)
  end

  private

  def redirect_for(image)
    if image.album.present?
      redirect_to album_images_path(image.album)
    else
      redirect_to images_path
    end
  end

  def current_scope
    @album || @current_user
  end

  def fetch_album
    if params[:album_id].present?
      @album = @current_user.albums.find(params[:album_id])
    end
  end

  def permitted_params
    params.require(:image).permit(:user_id, :album_id, :image)
  end
end
