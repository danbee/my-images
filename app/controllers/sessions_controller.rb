class SessionsController < ApplicationController
  def create
    if org.nil? || in_organization?(org)
      session[:token] = auth.credentials.token
      user = User.find_or_create_from_auth(auth)
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "You must be in the #{org} organization "\
                      "to access that page"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:token] = nil
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to root_path
  end

  private

  def org
    ENV["GITHUB_ORG"]
  end

  def in_organization?(org_name)
    organizations.select do |organization|
      organization["login"] == org_name
    end.any?
  end

  def organizations
    JSON.parse(get_organizations.body)
  end

  def get_organizations
    HTTP.
      auth("token #{auth.credentials.token}").
      get(organizations_url)
  end

  def organizations_url
    "https://api.github.com/user/orgs"
  end

  def auth
    request.env["omniauth.auth"]
  end
end
