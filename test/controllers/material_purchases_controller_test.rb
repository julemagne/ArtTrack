require 'test_helper'

class MaterialPurchasesControllerTest < ActionController::TestCase
  setup do
    @material_purchase = material_purchases(:one)
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:material_purchases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create material_purchase" do
    assert_difference('MaterialPurchase.count') do
      post :create, material_purchase: { cost: @material_purchase.cost, name: @material_purchase.name, units: @material_purchase.units, user_id: @material_purchase.user_id }
    end

    assert_redirected_to material_purchases_path
  end

  test "should show material_purchase" do
    get :show, id: @material_purchase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @material_purchase
    assert_response :success
  end

  test "should update material_purchase" do
    patch :update, id: @material_purchase, material_purchase: { cost: @material_purchase.cost, name: @material_purchase.name, units: @material_purchase.units, user_id: @material_purchase.user_id }
    assert_redirected_to material_purchase_path(assigns(:material_purchase))
  end

  test "should destroy material_purchase" do
    assert_difference('MaterialPurchase.count', -1) do
      delete :destroy, id: @material_purchase
    end

    assert_redirected_to material_purchases_path
  end
end
