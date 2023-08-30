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

ActiveRecord::Schema[7.0].define(version: 2023_08_26_231951) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "address"
    t.bigint "doctor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_clinics_on_doctor_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "bio"
    t.string "experience_years"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "reservation_date"
    t.time "reservation_time"
    t.boolean "status"
    t.bigint "user_id", null: false
    t.bigint "doctor_id", null: false
    t.bigint "clinic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_reservations_on_clinic_id"
    t.index ["doctor_id"], name: "index_reservations_on_doctor_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
    t.bigint "doctor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_specialties_on_doctor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.date "birthdate"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clinics", "doctors"
  add_foreign_key "doctors", "users"
  add_foreign_key "reservations", "clinics"
  add_foreign_key "reservations", "doctors"
  add_foreign_key "reservations", "users"
  add_foreign_key "specialties", "doctors"
end
