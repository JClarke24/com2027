require 'test_helper'

class TutorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in tutors(:tutor1)
  end

  test "should get tutor dashboard" do
    get root_url
    assert_response :success

    assert_select 'h1', 'Welcome to your tutor dashboard!'
  end

  test "should get tutor profile" do
    get authenticated_tutor_profile_url
    assert_response :success
  end

end
