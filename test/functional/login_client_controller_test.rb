require 'test_helper'

class LoginClientControllerTest < ActionController::TestCase
  test "should get login_client" do
    get :login_client
    assert_response :success
  end

  test "should get logout_client" do
    get :logout_client
    assert_response :success
  end

end
