require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success

    # assert_select 'h1', 'BeeSmart'
    # assert_select 'p', 'The social language app'
  end

end
