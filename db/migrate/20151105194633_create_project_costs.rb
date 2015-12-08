class CreateProjectCosts < ActiveRecord::Migration
  def change
    create_table :project_costs do |t|
      t.integer :project_id
      t.string :cost_type
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
