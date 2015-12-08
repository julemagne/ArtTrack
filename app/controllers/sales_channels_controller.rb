class SalesChannelsController < ApplicationController
  before_action :require_login
  before_action :set_sales_channel, only: [:show, :edit, :update, :destroy]

  # GET /sales_channels
  def index
    if params[:search]
      @sales_channels = sales_channel_scope.search(params[:search])
    else
      @sales_channels = sales_channel_scope.order(:name)
    end

  end

  # GET /sales_channels/1
  def show
  end

  # GET /sales_channels/new
  def new
    @sales_channel = SalesChannel.new
  end

  # GET /sales_channels/1/edit
  def edit
  end

  # POST /sales_channels
  def create
    @sales_channel = SalesChannel.new(sales_channel_params)
    if @sales_channel.save
      redirect_to @sales_channel, notice: 'Sales channel was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sales_channels/1
  def update
    if @sales_channel.update(sales_channel_params)
      redirect_to @sales_channel, notice: 'Sales channel was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sales_channels/1
  def destroy
    @sales_channel.destroy
    redirect_to sales_channels_url, notice: 'Sales channel was successfully destroyed.'
  end

  def get_data
    respond_to do |format|
      format.json {render json: sales_channel_scope.amount_by_channel}
    end
  end
  private
    # So that people cannot PATCH and DELETE unless they are the @current_user
    def sales_channel_scope
      SalesChannel.where(user_id: @current_user.id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_channel
      begin
        @sales_channel = sales_channel_scope.find(params[:id])
      rescue
        redirect_to dashboard_user_path(@current_user.id), notice: "Not found."
      end
    end

    # Only allow a trusted parameter "white list" through.
    def sales_channel_params
      params.require(:sales_channel).permit(:user_id, :name, :description)
    end
end
