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

ActiveRecord::Schema[7.0].define(version: 2024_04_14_181755) do
  create_table "answers", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "description"
    t.integer "position"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "applied_instruments", force: :cascade do |t|
    t.integer "instrument_id", null: false
    t.integer "user_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instrument_id"], name: "index_applied_instruments_on_instrument_id"
    t.index ["user_id"], name: "index_applied_instruments_on_user_id"
  end

  create_table "evaluated_answers", force: :cascade do |t|
    t.integer "answer_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "applied_instrument_id"
    t.index ["answer_id"], name: "index_evaluated_answers_on_answer_id"
    t.index ["applied_instrument_id"], name: "index_evaluated_answers_on_applied_instrument_id"
    t.index ["user_id"], name: "index_evaluated_answers_on_user_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "instrument_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instrument_id"], name: "index_questions_on_instrument_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "registration_number"
    t.integer "role"
    t.date "birth_date"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "applied_instruments", "instruments"
  add_foreign_key "applied_instruments", "users"
  add_foreign_key "evaluated_answers", "answers"
  add_foreign_key "evaluated_answers", "applied_instruments"
  add_foreign_key "evaluated_answers", "users"
  add_foreign_key "questions", "instruments"
end
