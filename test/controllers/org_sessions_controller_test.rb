require 'test_helper'

class OrgSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get org_sessions_new_url
    assert_response :success
  end

end
