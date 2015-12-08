class MaterialPurchasesController < ApplicationController
  before_action :require_login
  before_action :set_material_purchase, only: [:show, :edit, :update, :destroy]

  # GET /material_purchases
  def index
    if params[:search]
      @material_purchases = material_purchase_scope.search(params[:search])
    else
      @material_purchases = material_purchase_scope.order(:name)
    end
  end

  # GET /material_purchases/1
  def show
  end

  # GET /material_purchases/new
  def new
    @material_purchase = MaterialPurchase.new
  end

  # GET /material_purchases/1/edit
  def edit
  end

  # POST /material_purchases
  def create
    @material_purchase = MaterialPurchase.new(material_purchase_params)
    @material_purchase.user_id = @current_user.id
    @material_purchase.units_remaining = @material_purchase.units
    if @material_purchase.save
      redirect_to material_purchases_path, notice: 'Inventory item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /material_purchases/1
  def update
    if @material_purchase.update(material_purchase_params)
      redirect_to @material_purchase, notice: 'Inventory item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /material_purchases/1
  def destroy
    @material_purchase.destroy
    redirect_to material_purchases_url, notice: 'Inventory item was successfully destroyed.'
  end

  private
    # So that people cannot PATCH and DELETE unless they are the @current_user
    def material_purchase_scope
      MaterialPurchase.where(user_id: @current_user.id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_material_purchase
      begin
        @material_purchase = material_purchase_scope.find(params[:id])
      rescue
        redirect_to dashboard_user_path(@current_user.id), notice: "Not found."
      end
    end

    # Only allow a trusted parameter "white list" through.
    def material_purchase_params
      params.require(:material_purchase).permit(:user_id, :name, :cost, :units, :receipt)
    end
end
