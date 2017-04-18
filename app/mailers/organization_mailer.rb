class OrganizationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.organization_mailer.organization_reset.subject
  #
  def organization_reset(organization)
    @organization = organization

    mail to: organization.email, subject: "Password Reset"
  end
end
