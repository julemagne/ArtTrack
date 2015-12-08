class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :public_profile
      t.string :time_zone
      t.decimal :hourly_rate

      t.timestamps null: false
    end
  end
end
