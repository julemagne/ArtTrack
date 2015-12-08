class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.integer :project_id
      t.datetime :start_time
      t.datetime :stop_time
      t.date :date

      t.timestamps null: false
    end
  end
end
