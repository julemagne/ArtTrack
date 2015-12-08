require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test "should get dashboard" do
    get :dashboard, id: @user

    assert_response :success
  end

  test "should get new" do
    get :new
    assert_redirected_to dashboard_user_path(session[:user_id])
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: 'email@email.com', hourly_rate: 12.32, name: 'bob', password: 'password', public_profile: false, time_zone: "Eastern Time (US & Canada)" }
    end
    assert_redirected_to profile_path
  end

  test "should show user" do
    get :profile, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { email: @user.email, hourly_rate: @user.hourly_rate, name: @user.name, password_digest: @user.password_digest, public_profile: @user.public_profile, time_zone: @user.time_zone }
    assert_redirected_to profile_path
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
