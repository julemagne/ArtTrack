class CreateMaterialPurchases < ActiveRecord::Migration
  def change
    create_table :material_purchases do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.decimal :cost
      t.decimal :units

      t.timestamps null: false
    end
  end
end
