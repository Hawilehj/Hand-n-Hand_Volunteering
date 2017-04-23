class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #Controller for the application

  #Must include session from both user or organization
  include SessionsHelper
  include OrgSessionsHelper

  private

  # Simple; checks if user is logged in
  def logged_in_user
    unless logged_in?
      # Stores the current path
      store_location
      # Then redirects to the login url
      flash[:danger] = "Please log in."
      redirect_to login_url
    end

    # Same as above but works for organization
    def logged_in_organization
      unless signed_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to signin_url
      end
    end
  end
end
