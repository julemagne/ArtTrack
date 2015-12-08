require 'test_helper'

class SessionControllerTest < ActionController::TestCase

  test "should post create successfully and redirect to dashboard" do
    post :create, { email: "julie@email.com", password: "password" }
    assert_redirected_to dashboard_user_path(users(:one))
  end

  test "should post create unsuccessfully and redirect to login" do
    post :create, { email: "lkjadsfsdf@email.com", password: "sdfsdfasdfsdfa" }
    assert_redirected_to :login
  end

  test "should delete destroy" do
    delete :destroy
    assert_redirected_to :login
  end

end
