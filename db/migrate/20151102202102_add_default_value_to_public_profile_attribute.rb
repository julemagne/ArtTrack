class AddDefaultValueToPublicProfileAttribute < ActiveRecord::Migration
  def change
    change_column_default :users, :public_profile, false
  end
end
