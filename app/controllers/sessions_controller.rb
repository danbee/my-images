class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth(auth)
    session[:current_user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
