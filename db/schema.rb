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

ActiveRecord::Schema.define(version: 20181104195523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer "book_id"
    t.integer "lesson_id"
    t.integer "points"
    t.string "assignment_title"
    t.string "assignment_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_visit_logs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "subject_id"
    t.string "book_name"
    t.string "book_description"
    t.string "url_path"
    t.string "book_weights_string_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boxes", force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "video_id", default: 0
    t.integer "pic_id", default: 0
    t.integer "powerpoint_id", default: 0
    t.integer "doc_id", default: 0
    t.integer "ordering"
    t.string "title"
    t.integer "paragraph_id", default: 0
    t.integer "solve_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "subject_id"
    t.integer "book_id"
    t.integer "section_id"
    t.string "chapter_name"
    t.string "chapter_description"
    t.string "url_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "last_lesson_visited"
  end

  create_table "docs", force: :cascade do |t|
    t.integer "box_id"
    t.integer "note_type"
    t.string "doc_url"
    t.string "doc_path"
    t.integer "doc_is_path?", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "student_id"
    t.integer "subject_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.integer "student_id"
    t.integer "book_id"
    t.integer "assignment_id"
    t.integer "grade_weight_index"
    t.integer "order_placement"
    t.float "score_out_of_points"
    t.string "teacher_note_for_grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "subject_id"
    t.integer "book_id"
    t.integer "section_id"
    t.integer "chapter_id"
    t.string "lesson_name"
    t.string "lesson_description"
    t.string "url_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "category"
    t.string "title"
    t.integer "order_cato"
    t.integer "order_title"
    t.string "url_path"
    t.string "hierarchy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer "box_id"
    t.integer "user_id"
    t.integer "note_type"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paragraphs", force: :cascade do |t|
    t.integer "box_id"
    t.integer "note_type"
    t.string "paragraph_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pics", force: :cascade do |t|
    t.integer "box_id"
    t.integer "note_type"
    t.string "pic_url"
    t.string "pic_path"
    t.integer "pic_is_path?", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "powerpoints", force: :cascade do |t|
    t.integer "box_id"
    t.integer "note_type"
    t.string "powerpoint_url"
    t.string "powerpoint_path"
    t.integer "powerpoint_is_path?", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "subject_id"
    t.integer "book_id"
    t.string "section_name"
    t.string "section_description"
    t.string "url_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solves", force: :cascade do |t|
    t.integer "box_id"
    t.integer "note_type"
    t.string "solve_math"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.integer "teacher_id"
    t.string "subject_name"
    t.string "subject_description"
    t.string "url_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "is_teacher", default: false
    t.string "first_name"
    t.string "last_name"
    t.string "user_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_code"], name: "index_users_on_user_code", unique: true
  end

  create_table "valid_teacher_emails", force: :cascade do |t|
    t.string "teacher_email"
    t.string "sign_up_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.integer "box_id"
    t.integer "note_type"
    t.string "video_url"
    t.string "video_path"
    t.integer "video_is_path?", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
