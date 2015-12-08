class AddDurationToBusinessExpenses < ActiveRecord::Migration
  def change
    add_column :business_expenses, :duration, :string
  end
end
