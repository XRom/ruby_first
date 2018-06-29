require 'test_helper'

class Web::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get welcome_url
    assert_response :success
  end

end
