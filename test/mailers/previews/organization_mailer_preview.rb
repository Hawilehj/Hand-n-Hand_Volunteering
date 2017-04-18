# Preview all emails at http://localhost:3000/rails/mailers/organization_mailer
class OrganizationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/organization_mailer/organization_reset
  def organization_reset
    OrganizationMailer.organization_reset
  end

end
