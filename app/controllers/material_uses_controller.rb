class MaterialUsesController < ApplicationController
  before_action :require_login
  before_action :set_material_use, only: :destroy

  # DELETE /material_uses/1
  def destroy
    @material_use.destroy
    redirect_to material_uses_url, notice: 'Material use was successfully destroyed.'
  end

  private
    # So that people cannot PATCH and DELETE unless they are the @current_user
    def material_use_scope
      MaterialUse.where(project_id: Project.where(user_id: @current_user.id).pluck(:id))
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_material_use
      begin
        @material_use = material_use_scope.find(params[:id])
      rescue
        redirect_to dashboard_user_path(@current_user.id), notice: "Not found."
      end
    end
    # Only allow a trusted parameter "white list" through.
    def material_use_params
      params.require(:material_use).permit(:user_id, :material_purchase_id, :project_id, :units, :_delete)
    end
end
