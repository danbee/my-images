class ImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @images = @current_user.images
  end

  def create
    @image = Image.create(permitted_params)
    @current_user.images << @image
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
