class RemoveNameFromMaterialUses < ActiveRecord::Migration
  def change
    remove_column :material_uses, :name, :string
  end
end
