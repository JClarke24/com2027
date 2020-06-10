require 'test_helper'

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do

    @student = students(:student1)
    sign_in @student
  end


  test "should get index" do

    get submissions_url
    assert_response :success
  end

  test "should get new" do

    get submissions_url
    assert_response :success
  end

  test "should get create" do
    get submissions_url
    assert_response :success
  end

  test "should get destroy" do
    get submissions_url
    assert_response :success
  end

  test "should get show" do
    get submissions_url
    assert_response :success
  end

end
