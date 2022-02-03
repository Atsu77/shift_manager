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

ActiveRecord::Schema.define(version: 2022_01_31_013124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendance_classes", force: :cascade do |t|
    t.integer "registration_number"
    t.bigint "student_id"
    t.bigint "lecture_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lecture_id"], name: "index_attendance_classes_on_lecture_id"
    t.index ["student_id"], name: "index_attendance_classes_on_student_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.bigint "timetable_id"
    t.bigint "subject_id"
    t.datetime "hope_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_lectures_on_subject_id"
    t.index ["timetable_id"], name: "index_lectures_on_timetable_id"
  end

  create_table "student_distinctions", force: :cascade do |t|
    t.string "distinction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "phone_number"
    t.datetime "join_date"
    t.datetime "withdrawal_date"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_students_on_confirmation_token", unique: true
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_students_on_uid_and_provider", unique: true
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject_name"
    t.bigint "student_distinction_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_distinction_id"], name: "index_subjects_on_student_distinction_id"
  end

  create_table "timetables", force: :cascade do |t|
    t.string "time_tables"
    t.datetime "starting_time"
    t.datetime "ending_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "attendance_classes", "lectures"
  add_foreign_key "attendance_classes", "students"
  add_foreign_key "lectures", "subjects"
  add_foreign_key "lectures", "timetables"
  add_foreign_key "subjects", "student_distinctions"
end
