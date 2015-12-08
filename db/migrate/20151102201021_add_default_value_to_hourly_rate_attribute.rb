class AddDefaultValueToHourlyRateAttribute < ActiveRecord::Migration
  def change
    change_column_default :users, :hourly_rate, 20
  end
end
