class AddDefaultValueToSuccessAttribute < ActiveRecord::Migration
  def change
    change_column_default :sales_goals, :success, false
  end
end
