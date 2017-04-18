require 'test_helper'

class OrganizationMailerTest < ActionMailer::TestCase
  test "organization_reset" do
    mail = OrganizationMailer.organization_reset
    assert_equal "Organization reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
