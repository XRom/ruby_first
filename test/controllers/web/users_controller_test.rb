require 'test_helper'

class Web::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get web_users_new_url
    assert_response :success
  end

  test "should get create" do
    get web_users_create_url
    assert_response :success
  end

end
