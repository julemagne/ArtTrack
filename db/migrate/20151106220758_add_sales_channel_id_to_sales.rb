class AddSalesChannelIdToSales < ActiveRecord::Migration
  def change
    add_column :sales, :sales_channel_id, :integer
  end
end
