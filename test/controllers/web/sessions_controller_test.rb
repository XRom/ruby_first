require 'test_helper'

class Web::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should post create" do
    password = generate :string
    developer = create(:developer, {
      password: password
    })

    post session_url, params: { session: { email: developer.email, password: password } }

    assert_response :redirect
  end

  test "should delete destroy" do
    
    delete session_url

    assert_response :redirect
  end

end
