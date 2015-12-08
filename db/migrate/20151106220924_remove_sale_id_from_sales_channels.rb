class RemoveSaleIdFromSalesChannels < ActiveRecord::Migration
  def change
    remove_column :sales_channels, :sale_id, :integer
  end
end
