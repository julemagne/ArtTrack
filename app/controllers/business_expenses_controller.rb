class BusinessExpensesController < ApplicationController
  before_action :require_login
  before_action :set_business_expense, only: [:show, :edit, :update, :destroy]

  # GET /business_expenses
  def index
    if params[:search]
      @business_expenses = business_expense_scope.search(params[:search])
    else
      @business_expenses = business_expense_scope
    end
  end

  # GET /business_expenses/1
  def show
  end

  # GET /business_expenses/new
  def new
    @business_expense = BusinessExpense.new
  end

  # GET /business_expenses/1/edit
  def edit
  end

  # POST /business_expenses
  def create
    @business_expense = BusinessExpense.new(business_expense_params)
    @business_expense.user_id = @current_user.id
    if @business_expense.save
      redirect_to @business_expense, notice: 'Business expense was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /business_expenses/1
  def update
    if @business_expense.update(business_expense_params)
      redirect_to @business_expense, notice: 'Business expense was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /business_expenses/1
  def destroy
    @business_expense.destroy
    redirect_to business_expenses_url, notice: 'Business expense was successfully destroyed.'
  end

  private
    # So that people cannot PATCH and DELETE unless they are the @current_user
    def business_expense_scope
      BusinessExpense.where(user_id: @current_user.id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_business_expense
      begin
        @business_expense = business_expense_scope.find(params[:id])
      rescue
        redirect_to dashboard_user_path(@current_user.id), notice: "Not found."
      end
    end

    # Only allow a trusted parameter "white list" through.
    def business_expense_params
      params.require(:business_expense).permit(:user_id, :name, :description, :amount, :recurring, :date)
    end
end
