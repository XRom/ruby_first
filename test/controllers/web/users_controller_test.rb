require 'test_helper'

class Web::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should get create" do
    post users_url
    assert_response :success
  end

end
