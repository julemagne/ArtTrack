class AddSalesChannelIdToSalesGoals < ActiveRecord::Migration
  def change
    add_column :sales_goals, :sales_channel_id, :integer
  end
end
