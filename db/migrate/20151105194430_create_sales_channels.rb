class CreateSalesChannels < ActiveRecord::Migration
  def change
    create_table :sales_channels do |t|
      t.integer :sale_id
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
