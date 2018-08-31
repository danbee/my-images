class TagsController < ApplicationController
  before_action :authenticate_user!

  def create
    image = @current_user.images.find(params[:image_id])
    tag = params[:tag]
    image.tags << tag
    image.save

    redirect_to([:user, image])
  end

  def destroy
    image = @current_user.images.find(params[:image_id])
    tag = params[:id]
    image.tags.delete(tag)
    image.save

    redirect_to([:user, image])
  end
end
