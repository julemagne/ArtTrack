class SalesGoalsController < ApplicationController
  before_action :require_login
  before_action :set_sales_goal, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, only: [:show, :edit, :update, :destroy]
  before_action :check_time_set, only: [:update]

  # GET /sales_goals
  def index
    if params[:inactive]
      @goals = sales_goal_scope.where('end_time < ?', Date.today).order(start_time: :desc)
      # @goals = @goals.select{|goal| goal.success == true} if params[:success]
    else
      @goals = sales_goal_scope.where('end_time >= ?', Date.today).order(start_time: :desc)
    end
  end

  # GET /sales_goals/1
  def show
  end

  # GET /sales_goals/new
  def new
    @sales_goal = SalesGoal.new
    @sales_channels = SalesChannel.where(user_id: @current_user.id)
  end

  # GET /sales_goals/1/edit
  def edit
    @sales_channels = SalesChannel.where(user_id: @current_user.id)
  end

  # POST /sales_goals
  def create
    @sales_goal = SalesGoal.new(sales_goal_params)
    @sales_goal.user = @current_user
    unless params[:number].blank?
      @sales_goal.end_time = @sales_goal.start_time + eval(@sales_goal.length_of_time.tr(' ','.'))
      if @sales_goal.save
        redirect_to @sales_goal, notice: 'Sales goal was successfully created.'
      else
        redirect_to new_sales_goal_path, error: 'You must specify an amount and length of time.'
      end
    else
      redirect_to new_sales_goal_path, error: 'You must specify an amount and length of time.'
    end
  end

  # PATCH/PUT /sales_goals/1
  def update
    if @sales_goal.update(sales_goal_params)
      @sales_goal.end_time = @sales_goal.start_time + eval(@sales_goal.length_of_time.tr(' ','.'))
      if @sales_goal.save
        redirect_to @sales_goal, notice: 'Sales goal was successfully updated.'
      else
        redirect_to edit_sales_goal_path
      end
    else
      redirect_to edit_sales_goal_path
    end
  end

  # DELETE /sales_goals/1
  def destroy
    @sales_goal.destroy
    redirect_to sales_goals_url, notice: 'Sales goal was successfully destroyed.'
  end

  private
    # So that people cannot PATCH and DELETE unless they are the @current_user
    def sales_goal_scope
      SalesGoal.where(user_id: @current_user.id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_goal
      begin
        @sales_goal = sales_goal_scope.find(params[:id])
      rescue
        redirect_to dashboard_user_path(@current_user.id), notice: "Not found."
      end
    end

    def check_time_set
      if params[:id]
        redirect_to edit_sales_goal_path if params[:number].blank?
      else
        flash[:error] = "Fields were left blank"
        redirect_to new_sales_goal_path if params[:number].blank?
      end
    end

    # Only allow a trusted parameter "white list" through.
    def sales_goal_params
      params[:sales_goal][:length_of_time] = "#{params[:number]} #{params[:units]}"
      params.require(:sales_goal).permit(:user_id, :amount, :length_of_time, :start_time, :sales_channel_id, :number, :units)
    end

    def validate_user
      user = @sales_goal.user
      redirect_to dashboard_user_path(@current_user.id) unless user == @current_user
    end
end
