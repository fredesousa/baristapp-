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

ActiveRecord::Schema[7.1].define(version: 2024_07_16_094114) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coffees", force: :cascade do |t|
    t.string "name"
    t.string "origin"
    t.string "roaster"
    t.text "description"
    t.string "strength"
    t.string "coffee_type"
    t.string "machin_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "coffee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coffee_id"], name: "index_favorites_on_coffee_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "coffee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coffee_id"], name: "index_preferences_on_coffee_id"
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "description"
    t.float "rating"
    t.bigint "coffee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coffee_id"], name: "index_reviews_on_coffee_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
    t.string "habit"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "coffees"
  add_foreign_key "favorites", "users"
  add_foreign_key "preferences", "coffees"
  add_foreign_key "preferences", "users"
  add_foreign_key "reviews", "coffees"
end
