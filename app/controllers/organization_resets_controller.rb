class OrganizationResetsController < ApplicationController
  before_action :get_organization,  only: [:edit, :update]
  before_action :check_expiration,  only: [:edit, :update]

  def new
  end

  def create
    @organization = Organization.find_by(email: params[:organization_reset][:email].downcase)
    if @organization
    @organization.create_reset_digest
      @organization.send_organization_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email does not exist"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:organization][:password].empty?
      @organization.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @organization.update_attributes(organization_params)
      log_in @organization
      @organization.update_attribute(:reset_digest, nil)
      flash[:success] = "Password has been reset."
      redirect_to @organization
    else
      render 'edit'
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:password, :password_confirmation)
  end

  def get_organization
    @organization = Organization.find_by(email: params[:email])
  end

  def check_expiration
    if @organization.organization_reset_expired?
      flash[:danger] = "Password reset has expried."
      redirect_to new_organization_reset_url
    end
  end
end
