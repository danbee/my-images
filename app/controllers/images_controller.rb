class ImagesController < ApplicationController
  before_filter :authenticate_user!
end
