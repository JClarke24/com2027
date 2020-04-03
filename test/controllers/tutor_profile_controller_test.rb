require 'test_helper'

class TutorProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get tutorProfile" do
    get tutor_profile_tutorProfile_url
    assert_response :success
  end

end
