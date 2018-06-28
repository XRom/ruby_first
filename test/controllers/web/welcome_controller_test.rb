require 'test_helper'

class Web::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get web_welcome_show_url
    assert_response :success
  end

end
