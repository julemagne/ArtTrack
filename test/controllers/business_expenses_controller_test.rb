require 'test_helper'

class BusinessExpensesControllerTest < ActionController::TestCase
  setup do
    @business_expense = business_expenses(:one)
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_expense" do
    assert_difference('BusinessExpense.count') do
      post :create, business_expense: { amount: @business_expense.amount, description: @business_expense.description, name: @business_expense.name, recurring: @business_expense.recurring, user_id: @business_expense.user_id }
    end

    assert_redirected_to business_expense_path(assigns(:business_expense))
  end

  test "should show business_expense" do
    get :show, id: @business_expense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_expense
    assert_response :success
  end

  test "should update business_expense" do
    patch :update, id: @business_expense, business_expense: { amount: @business_expense.amount, description: @business_expense.description, name: @business_expense.name, recurring: @business_expense.recurring, user_id: @business_expense.user_id }
    assert_redirected_to business_expense_path(assigns(:business_expense))
  end

  test "should destroy business_expense" do
    assert_difference('BusinessExpense.count', -1) do
      delete :destroy, id: @business_expense
    end

    assert_redirected_to business_expenses_path
  end
end
