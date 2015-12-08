class RemoveDescriptionFromMaterialPurchases < ActiveRecord::Migration
  def change
    remove_column :material_purchases, :description, :text
  end
end
