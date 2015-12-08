class CreateBusinessExpenses < ActiveRecord::Migration
  def change
    create_table :business_expenses do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.decimal :amount
      t.boolean :recurring

      t.timestamps null: false
    end
  end
end
