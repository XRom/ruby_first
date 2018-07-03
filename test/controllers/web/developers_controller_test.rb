require 'test_helper'

class Web::DevelopersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_developer_url
    assert_response :success
  end

  test "should get create" do
    password = 'password_confirmation'
    developer = attributes_for(:developer).merge({
      password: password,
      password_confirmation: password
    })

    post developers_url, params: { developer: developer }
    assert_response :redirect
  end

end