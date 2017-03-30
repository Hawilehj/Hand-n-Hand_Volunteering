class OrganizationsController < ApplicationController
  before_action :correct_organization, only: [:index, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization = Organization.find(params[:id])
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  @organization = Organization.find(params[:id])
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      sign_in @organization
      flash[:success] = "Welcome #{@organization.name} to Hand in Hand Volunteering"
      redirect_to @organization
    else
      render 'new'
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(organization_params)
      flash[:success] = "Profile updated"
      redirect_to @organization
    else
      render 'edit'
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    Organization.find(params[:id]).destroy
    flash[:success] = "Organization deleted"
    redirect_to organizations_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.

  def correct_organization
    @organization = Organization.find(params[:id])
    redirect_to(root_url) unless current_organization?(@organization)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name,:email, :password, :password_digest)
    end

end
