require 'test_helper'

class MaterialUsesControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
    @material_purchase = material_purchases(:one)
    @material_use = material_uses(:one)
    @current_user = users(:one)
    @material_use.user_id = @current_user.id
    @material_use.save
    session[:user_id] = @current_user.id
  end

  test "should destroy material_use" do
    assert_difference('MaterialUse.count', -1) do
      delete :destroy, id: @material_use
    end

    assert_redirected_to material_uses_path
  end

end
