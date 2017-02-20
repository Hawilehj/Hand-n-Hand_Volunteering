require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "Hand in Hand Volunteering"
    assert_equal full_title("Help"), "Help | Hand in Hand Volunteering"
  end
end