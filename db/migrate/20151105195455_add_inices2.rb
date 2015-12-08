class AddInices2 < ActiveRecord::Migration
  def change
    add_index :business_expenses, :user_id
    add_index :material_purchases, :user_id
    add_index :material_uses, :material_purchase_id
    add_index :material_uses, :project_id
    add_index :project_costs, :project_id
    add_index :sales_channels, :sale_id
  end
end
