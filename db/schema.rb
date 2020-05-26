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

ActiveRecord::Schema.define(version: 2020_05_26_164544) do

  create_table "meetings", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "tutor_id"
    t.integer "student_id"
    t.string "location"
    t.datetime "startDateTime", null: false
    t.datetime "endDateTime", null: false
    t.boolean "student_accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language", default: "Language"
    t.string "image"
    t.string "forename", default: "First Name"
    t.string "surname", default: "Surname"
    t.date "dob"
    t.string "phone", default: "Phone Number"
    t.string "job", default: "Job"
    t.string "address", default: "City"
    t.string "country", default: "Country"
    t.integer "tutor_id"
    t.boolean "tutor_confirmed", default: false
    t.string "name"
    t.string "access_token"
    t.datetime "expires_at"
    t.string "refresh_token"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "tutors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language", default: "Language"
    t.string "location", default: "(0.0, 0.0)"
    t.string "image"
    t.string "forename", default: "First Name", null: false
    t.string "surname", default: "Surname", null: false
    t.date "dob"
    t.string "phone", default: "Phone Number"
    t.string "job", default: "Job"
    t.string "address", default: "City"
    t.string "country", default: "Country"
    t.text "description", default: "About me"
    t.string "description2", default: "What I offer?"
    t.integer "approval", default: 0, null: false
    t.index ["email"], name: "index_tutors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tutors_on_reset_password_token", unique: true
  end

end
