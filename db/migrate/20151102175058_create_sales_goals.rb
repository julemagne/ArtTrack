class CreateSalesGoals < ActiveRecord::Migration
  def change
    create_table :sales_goals do |t|
      t.integer :user_id
      t.decimal :amount
      t.string :length_of_time
      t.date :start_time
      t.boolean :success

      t.timestamps null: false
    end
  end
end
