require 'test_helper'

class LoginLogoutTest < ActionDispatch::IntegrationTest

  test "you cannot log in with invalid credentials" do
    get "/login" # you don't need to be logged in to see this page
    assert_equal 200, status # 200 OK

    get projects_path # request sent without logging in

    assert_equal response.code, "302" # 302 found
    assert_redirected_to login_path # testing you got redirected to the right place

    follow_redirect!

    assert_template "session/new"
    assert_template "layouts/_navbar"
    assert_template "layouts/_awesome_footer"
    assert_template "layouts/session" # look at all these things on the login page!

    post login_path, session: {email: "dafsdf@example.com", password: "sdfsadfa"}
    assert_redirected_to login_path
  end

end
