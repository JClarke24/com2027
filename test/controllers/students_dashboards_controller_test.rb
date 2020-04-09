require 'test_helper'

class StudentsDashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get student home page" do
    get authenticated_student_root_url
    assert_response :success
  end

  test "should get student profile" do
    get authenticated_student_profile_url
    assert_response :success
  end

end
