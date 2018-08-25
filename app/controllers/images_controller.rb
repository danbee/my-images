class ImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @images = @current_user.images
  end

  def show
    @image = @current_user.images.find(params[:id])
  end

  def create
    @image = Image.create(permitted_params)
    @current_user.images << @image
    TagImageJob.perform_later(image_id: @image.id)

    redirect_to user_images_path
  end

  def destroy
    image = @current_user.images.find(params[:id])
    image.destroy

    redirect_to user_images_path
  end

  private

  def permitted_params
    params.require(:image).permit(:user_id, :image)
  end
end
