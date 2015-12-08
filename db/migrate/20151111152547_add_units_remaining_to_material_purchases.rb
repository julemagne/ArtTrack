class AddUnitsRemainingToMaterialPurchases < ActiveRecord::Migration
  def change
    add_column :material_purchases, :units_remaining, :decimal
  end
end
