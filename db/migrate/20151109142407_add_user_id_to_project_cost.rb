class AddUserIdToProjectCost < ActiveRecord::Migration
  def change
    add_column :project_costs, :user_id, :integer
  end
end
