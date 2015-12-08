class AddDefaultValueToTimeZoneAttribute < ActiveRecord::Migration
  def change
    change_column_default :users, :time_zone, "Eastern Time (US & Canada)"
  end
end
