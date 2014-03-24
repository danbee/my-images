class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authenticate_user!
    redirect_to new_session_path unless session[:current_user_id].present?
    @current_user ||= User.find_by(id: session[:current_user_id])
  end
end
