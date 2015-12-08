class AddUserIdToSalesChannel < ActiveRecord::Migration
  def change
    add_column :sales_channels, :user_id, :integer
  end
end
