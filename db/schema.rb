# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151119015854) do

  create_table "business_expenses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "amount"
    t.boolean  "recurring"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "duration"
    t.date     "date"
  end

  add_index "business_expenses", ["user_id"], name: "index_business_expenses_on_user_id"

  create_table "material_purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.decimal  "cost"
    t.decimal  "units"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.decimal  "units_remaining"
    t.string   "receipt_file_name"
    t.string   "receipt_content_type"
    t.integer  "receipt_file_size"
    t.datetime "receipt_updated_at"
  end

  add_index "material_purchases", ["user_id"], name: "index_material_purchases_on_user_id"

  create_table "material_uses", force: :cascade do |t|
    t.integer  "material_purchase_id"
    t.integer  "project_id"
    t.decimal  "units"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
  end

  add_index "material_uses", ["material_purchase_id"], name: "index_material_uses_on_material_purchase_id"
  add_index "material_uses", ["project_id"], name: "index_material_uses_on_project_id"
  add_index "material_uses", ["user_id"], name: "index_material_uses_on_user_id"

  create_table "project_costs", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "cost_type"
    t.decimal  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "project_costs", ["project_id"], name: "index_project_costs_on_project_id"
  add_index "project_costs", ["user_id"], name: "index_project_costs_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "sales", force: :cascade do |t|
    t.integer  "project_id"
    t.decimal  "gross"
    t.decimal  "net"
    t.date     "date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "sales_channel_id"
    t.integer  "user_id"
  end

  add_index "sales", ["project_id"], name: "index_sales_on_project_id"
  add_index "sales", ["user_id"], name: "index_sales_on_user_id"

  create_table "sales_channels", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "sales_channels", ["user_id"], name: "index_sales_channels_on_user_id"

  create_table "sales_goals", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "amount"
    t.string   "length_of_time"
    t.date     "start_time"
    t.boolean  "success",          default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "sales_channel_id"
    t.date     "end_time"
  end

  add_index "sales_goals", ["sales_channel_id"], name: "index_sales_goals_on_sales_channel_id"
  add_index "sales_goals", ["user_id"], name: "index_sales_goals_on_user_id"

  create_table "time_entries", force: :cascade do |t|
    t.integer  "project_id"
    t.datetime "start_time"
    t.datetime "stop_time"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "total_time"
  end

  add_index "time_entries", ["project_id"], name: "index_time_entries_on_project_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "public_profile",      default: false
    t.string   "time_zone",           default: "Eastern Time (US & Canada)"
    t.decimal  "hourly_rate",         default: 20.0
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
