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

ActiveRecord::Schema.define(version: 2020_06_02_102327) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "forename", default: "First Name"
    t.string "surname", default: "Surname"
    t.date "dob"
    t.string "phone"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "tutor"
    t.string "language"
    t.string "topic"
    t.string "level"
    t.string "attachment"
    t.integer "tutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_quizzes_on_tutor_id"
  end

  create_table "rating_rates", force: :cascade do |t|
    t.decimal "value", precision: 25, scale: 16, default: "0.0"
    t.string "author_type", limit: 10, null: false
    t.integer "author_id", null: false
    t.string "resource_type", limit: 10, null: false
    t.integer "resource_id", null: false
    t.string "scopeable_type", limit: 10
    t.integer "scopeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id", "resource_type", "resource_id", "scopeable_type", "scopeable_id"], name: "index_rating_rates_on_author_and_resource_and_scopeable", unique: true
    t.index ["author_type", "author_id"], name: "index_rating_rates_on_author_type_and_author_id"
    t.index ["resource_type", "resource_id"], name: "index_rating_rates_on_resource_type_and_resource_id"
    t.index ["scopeable_type", "scopeable_id"], name: "index_rating_rates_on_scopeable_type_and_scopeable_id"
  end

  create_table "rating_ratings", force: :cascade do |t|
    t.decimal "average", precision: 25, scale: 16, default: "0.0"
    t.decimal "estimate", precision: 25, scale: 16, default: "0.0"
    t.integer "sum", default: 0
    t.integer "total", default: 0
    t.string "resource_type", limit: 10, null: false
    t.integer "resource_id", null: false
    t.string "scopeable_type", limit: 10
    t.integer "scopeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_type", "resource_id", "scopeable_type", "scopeable_id"], name: "index_rating_rating_on_resource_and_scopeable", unique: true
    t.index ["resource_type", "resource_id"], name: "index_rating_ratings_on_resource_type_and_resource_id"
    t.index ["scopeable_type", "scopeable_id"], name: "index_rating_ratings_on_scopeable_type_and_scopeable_id"
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
    t.boolean "rated"
    t.integer "current_rating", default: 0
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "submissions", force: :cascade do |t|
    t.integer "student_id"
    t.integer "tutor_id"
    t.string "description"
    t.string "submission"
    t.string "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_submissions_on_student_id"
    t.index ["tutor_id"], name: "index_submissions_on_tutor_id"
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
    t.decimal "rating"
    t.integer "num_rates"
    t.index ["email"], name: "index_tutors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tutors_on_reset_password_token", unique: true
  end

end
