class TagsController < ApplicationController
  before_action :authenticate_user!

  def create
    image = @current_user.images.find(params[:image_id])
    tag = params[:tag]

    if !image.tags.include?(tag)
      image.tags << tag
      image.save
      render partial: "tags/tag", locals: { image: image, tag: tag }
    else
      head :no_content, content_type: "text/html"
    end
  end

  def destroy
    image = @current_user.images.find(params[:image_id])
    tag = params[:id]
    image.tags.delete(tag)
    image.save

    head :no_content
  end
end
