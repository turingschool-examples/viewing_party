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


ActiveRecord::Schema.define(version: 2021_07_06_222037) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "movie_party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_party_id"], name: "index_attendees_on_movie_party_id"
    t.index ["user_id"], name: "index_attendees_on_user_id"
  end

  create_table "friends", force: :cascade do |t|
    t.integer "friender_id"
    t.integer "friendee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_parties", force: :cascade do |t|
    t.bigint "user_id"
    t.string "movie_title"
    t.datetime "date_time"
    t.index ["user_id"], name: "index_movie_parties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendees", "movie_parties"
  add_foreign_key "attendees", "users"
  add_foreign_key "movie_parties", "users"
end
