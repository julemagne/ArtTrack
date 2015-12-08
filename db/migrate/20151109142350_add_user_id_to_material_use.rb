class AddUserIdToMaterialUse < ActiveRecord::Migration
  def change
    add_column :material_uses, :user_id, :integer
  end
end
