class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include OrgSessionsHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end

    def logged_in_organization
      unless signed_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to signin_url
      end
    end
  end
end
