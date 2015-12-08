require 'test_helper'

class SalesChannelsControllerTest < ActionController::TestCase
  setup do
    @sale = sales(:one)
    @sales_channel = sales_channels(:one)
    @user = users(:one)
    session[:user_id] = @sales_channel.user_id

  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_channels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_channel" do
    assert_difference('SalesChannel.count') do
      post :create, sales_channel: { description: @sales_channel.description, name: @sales_channel.name}
    end

    assert_redirected_to sales_channel_path(assigns(:sales_channel))
  end

  test "should show sales_channel" do
    get :show, id: @sales_channel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_channel
    assert_response :success
  end

  test "should update sales_channel" do
    patch :update, id: @sales_channel, sales_channel: { description: @sales_channel.description, name: @sales_channel.name}
    assert_redirected_to sales_channel_path(assigns(:sales_channel))
  end

  test "should destroy sales_channel" do
    assert_difference('SalesChannel.count', -1) do
      delete :destroy, id: @sales_channel
    end

    assert_redirected_to sales_channels_path
  end
end
