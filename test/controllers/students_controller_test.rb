require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in students(:student1)
  end

  test "should get student dashboard" do
    get root_url
    assert_response :success

    assert_select 'h1', 'Welcome to your student dashboard!'
  end

  test "should get student profile" do
    get authenticated_student_profile_url
    assert_response :success
  end

end
