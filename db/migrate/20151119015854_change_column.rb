class ChangeColumn < ActiveRecord::Migration
  def change
    add_index :material_uses, :user_id
    add_index :project_costs, :user_id
    add_index :sales, :user_id
    add_index :sales_channels, :user_id
    add_index :sales_goals, :sales_channel_id
  end
end
