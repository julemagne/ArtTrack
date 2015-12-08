class AddIndices < ActiveRecord::Migration
  def change
    add_index :sales, :project_id
    add_index :projects, :user_id
    add_index :sales_goals, :user_id
    add_index :time_entries, :project_id
  end
end
