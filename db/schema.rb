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

ActiveRecord::Schema[7.0].define(version: 2023_08_08_061449) do
  create_table "posts", charset: "utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.string "disease", null: false
    t.string "name", null: false
    t.integer "age", null: false
    t.integer "sex", null: false
    t.string "family", null: false
    t.string "airway", null: false
    t.string "breathing", null: false
    t.string "circulation", null: false
    t.string "dysfunction_cns", null: false
    t.string "exposure"
    t.string "symptom", null: false
    t.string "allergy", null: false
    t.string "medicine", null: false
    t.string "past_history", null: false
    t.string "last_meal", null: false
    t.string "event", null: false
    t.string "risk_factor", null: false
    t.string "others"
    t.text "story", null: false
    t.text "point", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.string "department", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "posts", "users"
end
