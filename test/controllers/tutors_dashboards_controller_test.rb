require 'test_helper'

class TutorsDashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get tutor home page" do
    get authenticated_tutor_root_url
    assert_response :success
  end

  test "should get tutor profile" do
    get authenticated_tutor_profile_url
    assert_response :success
  end

end
