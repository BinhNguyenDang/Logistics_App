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

ActiveRecord::Schema[7.1].define(version: 2024_08_19_012829) do
  create_table "deadlines", force: :cascade do |t|
    t.integer "min_distance"
    t.integer "max_distance"
    t.integer "deadline"
    t.integer "mode_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mode_id"], name: "index_deadlines_on_mode_id"
  end

  create_table "modes", force: :cascade do |t|
    t.string "name"
    t.integer "min_distance"
    t.integer "max_distance"
    t.integer "min_weight"
    t.integer "max_weight"
    t.integer "fixed_fee"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer "min_weight"
    t.integer "max_weight"
    t.float "price_per_km"
    t.integer "mode_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mode_id"], name: "index_prices_on_mode_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "plate"
    t.string "brand"
    t.string "model"
    t.string "category"
    t.integer "year"
    t.integer "capacity"
    t.boolean "status", default: true
    t.integer "mode_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mode_id"], name: "index_vehicles_on_mode_id"
  end

  add_foreign_key "deadlines", "modes"
  add_foreign_key "prices", "modes"
  add_foreign_key "vehicles", "modes"
end
