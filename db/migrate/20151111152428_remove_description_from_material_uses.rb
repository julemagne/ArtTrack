class RemoveDescriptionFromMaterialUses < ActiveRecord::Migration
  def change
    remove_column :material_uses, :description, :text
  end
end
