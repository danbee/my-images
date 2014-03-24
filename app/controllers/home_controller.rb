class HomeController < ApplicationController
  def index
    redirect_to user_images_path
  end
end
