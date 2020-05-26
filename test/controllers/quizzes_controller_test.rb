require 'test_helper'

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do

    @tutor = tutors(:tutor1)
    sign_in @tutor
  end


  test "should get index" do
    get quizzes_url
    assert_response :success
  end

  test "should get new" do
    get quizzes_url
    assert_response :success
  end

  test "should get create" do
    get quizzes_url
    assert_response :success
  end

  test "should get destroy" do
    get quizzes_url
    assert_response :success
  end

end
