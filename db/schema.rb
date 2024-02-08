# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_25_120455) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flags", force: :cascade do |t|
    t.bigint "user_id"
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flags_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "foreign_country_investment", default: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.datetime "invoice_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "loyalty_points", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "point", null: false
    t.boolean "is_expired", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_loyalty_points_on_user_id"
  end

  create_table "loyalty_rewards", force: :cascade do |t|
    t.string "reward_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_rewards", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "loyalty_reward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loyalty_reward_id"], name: "index_user_rewards_on_loyalty_reward_id"
    t.index ["user_id"], name: "index_user_rewards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "dob", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tier", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "flags", "users"
  add_foreign_key "invoices", "users"
  add_foreign_key "loyalty_points", "users"
  add_foreign_key "user_rewards", "loyalty_rewards"
  add_foreign_key "user_rewards", "users"
end
