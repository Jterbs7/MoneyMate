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

ActiveRecord::Schema[7.0].define(version: 2023_06_15_092202) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budgets", force: :cascade do |t|
    t.string "name"
    t.float "amount"
    t.bigint "category_budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_budget_id"], name: "index_budgets_on_category_budget_id"
  end

  create_table "category_budgets", force: :cascade do |t|
    t.string "name"
    t.integer "amount"
    t.string "month"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
    t.index ["user_id"], name: "index_category_budgets_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.float "amount"
    t.string "description"
    t.string "merchant"
    t.datetime "date"
    t.bigint "budget_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_expenses_on_budget_id"
  end

  create_table "profile_badges", force: :cascade do |t|
    t.string "month"
    t.bigint "profile_id", null: false
    t.bigint "badge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_profile_badges_on_badge_id"
    t.index ["profile_id"], name: "index_profile_badges_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.string "username"
    t.integer "age"
    t.decimal "monthly_income"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "tips", force: :cascade do |t|
    t.string "advice_level"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "budgets", "category_budgets"
  add_foreign_key "category_budgets", "users"
  add_foreign_key "expenses", "budgets"
  add_foreign_key "profile_badges", "badges"
  add_foreign_key "profile_badges", "profiles"
  add_foreign_key "profiles", "users"
end
