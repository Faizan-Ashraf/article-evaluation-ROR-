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

ActiveRecord::Schema[8.1].define(version: 2026_03_02_104650) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "competitions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "created_by_id", null: false
    t.text "description"
    t.text "evaluation_criteria"
    t.boolean "is_active", default: true
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_competitions_on_created_by_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "competition_id", null: false
    t.bigint "competitor_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "evaluated_at"
    t.text "feedback"
    t.integer "score"
    t.string "status", default: "Pending"
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_submissions_on_competition_id"
    t.index ["competitor_id"], name: "index_submissions_on_competitor_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "role", default: "competitor"
    t.datetime "updated_at", null: false
    t.string "username", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "competitions", "users", column: "created_by_id"
  add_foreign_key "submissions", "competitions"
  add_foreign_key "submissions", "users", column: "competitor_id"
end
