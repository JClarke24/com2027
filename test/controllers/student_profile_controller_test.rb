require 'test_helper'

class StudentProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get studentProfile" do
    get student_profile_studentProfile_url
    assert_response :success
  end

end
