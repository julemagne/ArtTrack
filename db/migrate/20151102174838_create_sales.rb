class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :project_id
      t.decimal :gross
      t.decimal :net
      t.date :date

      t.timestamps null: false
    end
  end
end
