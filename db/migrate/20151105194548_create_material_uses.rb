class CreateMaterialUses < ActiveRecord::Migration
  def change
    create_table :material_uses do |t|
      t.integer :material_purchase_id
      t.integer :project_id
      t.string :name
      t.text :description
      t.decimal :units

      t.timestamps null: false
    end
  end
end
