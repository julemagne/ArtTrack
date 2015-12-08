require 'test_helper'

class SalesControllerTest < ActionController::TestCase
  setup do
    @sale = sales(:one)
    @current_user = users(:one)
    @sale.user_id = @current_user.id
    @sale.save
    session[:user_id] = @current_user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales)
  end

  test "should get new" do
    get :new, project_id: projects(:one).id
    assert_response :success
  end

  test "should create sale" do
    assert_difference('Sale.count') do
      post :create, sale: { date: @sale.date, gross: @sale.gross, net: @sale.net, project_id: @sale.project_id }
    end

    assert_redirected_to sales_path
  end

  test "should show sale" do
    get :show, id: @sale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sale
    assert_response :success
  end

  test "should update sale" do
    patch :update, id: @sale, sale: { date: @sale.date, gross: @sale.gross, net: @sale.net, project_id: @sale.project_id }
    assert_redirected_to sale_path(assigns(:sale))
  end

  test "should destroy sale" do
    assert_difference('Sale.count', -1) do
      delete :destroy, id: @sale
    end

    assert_redirected_to sales_path
  end
end
