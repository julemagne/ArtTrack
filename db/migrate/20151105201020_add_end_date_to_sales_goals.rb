class AddEndDateToSalesGoals < ActiveRecord::Migration
  def change
    add_column :sales_goals, :end_time, :date
  end
end
