class AddDateToBusinessExpense < ActiveRecord::Migration
  def change
    add_column :business_expenses, :date, :date
  end
end
