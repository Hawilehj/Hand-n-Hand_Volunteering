class OrgSessionsController < ApplicationController
  def new
  end

  def create
    organization = Organization.find_by(email: params[:session][:email].downcase)
    if organization && organization.authenticate(params[:session][:password])
      sign_in organization
      redirect_to organization
    else
      flash.now[:danger] = 'Invalid email or password combination'
    render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
