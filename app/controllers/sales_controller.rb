class SalesController < ApplicationController
  before_action :require_login
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  after_action :update_goals, only: [:create, :update, :destroy]
  # GET /sales
  def index
    # We need a button to show more, either Ajax or navigate to page of next 50 or all
    if params[:search]
      @sales = sale_scope.search(params[:search])
    else
      @sales = Sale.includes(:sales_channel, :project).joins(:project)
          .where(projects: {user_id: @current_user.id})
          .order(date: :desc, created_at: :desc)
    end
  end

  # GET /sales/1
  def show
  end

  # GET /sales/new
  def new
    if params[:project_id]
      @project_name = Project.find(params[:project_id]).name
      @sale = Sale.new
      @sales_channels = SalesChannel.where(user_id: @current_user.id)
    else
      redirect_to dashboard_user_path(session[:user_id]), notice: "You must mark a project as sold to create a sale record."
    end
  end

  # GET /sales/1/edit
  def edit
    @sales_channels = SalesChannel.where(user_id: @current_user.id)
    @sales = Sale.includes(:sales_channel, :project).joins(:project)
        .where(projects: {user_id: @current_user.id})
        .order(date: :desc)
  end

  # POST /sales
  def create
    @sale = Sale.new(sale_params)
    @sale.net = @sale.net_profit
    if @sale.save
      redirect_to sales_path, notice: 'Sale record was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sales/1
  def update
    if @sale.update(sale_params)
      @sale.net = @sale.net_profit
      @sale.save
      redirect_to @sale, notice: 'Sale record was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sales/1
  def destroy
    @sale.destroy
    redirect_to sales_url, notice: 'Sale record was successfully destroyed.'
  end

  private
    # So that people cannot PATCH and DELETE unless they are the @current_user
    def sale_scope
      Sale.where(user_id: @current_user.id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      begin
        @sale = sale_scope.find(params[:id])
      rescue
        redirect_to dashboard_user_path(@current_user.id), notice: "Could not find that sale record."
      end
    end

    # Only allow a trusted parameter "white list" through.
    def sale_params
      params.require(:sale).permit(:user_id, :sales_channel_id, :project_id, :gross, :date)
    end

    def update_goals
      SalesGoal.update_goals(@current_user.id)
    end
end
