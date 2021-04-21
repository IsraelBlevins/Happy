# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_18_004302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "member_id"
    t.string "commenter"
    t.string "body"
    t.datetime "comment_date"
    t.datetime "comment_time"
    t.integer "recipient_ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "displayed_questions", force: :cascade do |t|
    t.string "question"
    t.string "question_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "member_responses", force: :cascade do |t|
    t.integer "member_id"
    t.string "question_asked"
    t.string "response_type"
    t.string "response"
    t.datetime "response_date"
    t.boolean "checked_off", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer "member_id"
    t.string "display_name"
    t.integer "group_id"
    t.string "email"
    t.string "password"
    t.boolean "superUser", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "image", default: "https://i.imgur.com/JVYZerS.jpg"
  end

  create_table "mood_ratings", force: :cascade do |t|
    t.integer "member_id"
    t.integer "rating"
    t.boolean "morning", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "slider_pictures", force: :cascade do |t|
    t.string "image_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "video_link"
    t.datetime "upload_date"
    t.string "uploader_comment"
    t.string "video_title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
