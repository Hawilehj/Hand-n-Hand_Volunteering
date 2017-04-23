module OrgSessionsHelper

  def sign_in(organization)
    session[:organization_id] = organization.id
  end

  def current_organization
    @current_organization ||= Organization.find_by(id: session[:organization_id])
  end

  def signed_in?
    !current_organization.nil?
  end

  def sign_out
    session.delete(:organization_id)
    @current_organization = nil
  end

  def current_organization?(organization)
    organization == current_organization
  end

end
