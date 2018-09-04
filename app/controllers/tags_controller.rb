class TagsController < ApplicationController
  before_action :authenticate_user!

  def create
    image = @current_user.images.find(params[:image_id])
    tag = params[:tag]
    image.tags << tag unless image.tags.include? tag
    image.save

    respond_to do |format|
      format.html { redirect_to([:user, image]) }
      format.js { render "index", locals: { image: image, tags: image.tags } }
    end
  end

  def destroy
    image = @current_user.images.find(params[:image_id])
    tag = params[:id]
    image.tags.delete(tag)
    image.save

    respond_to do |format|
      format.html { redirect_to([:user, image]) }
      format.js { render "index", locals: { image: image, tags: image.tags } }
    end
  end
end
