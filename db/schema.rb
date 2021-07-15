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

ActiveRecord::Schema.define(version: 2021_07_07_232623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.bigint "party_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_attendees_on_party_id"
    t.index ["user_id"], name: "index_attendees_on_user_id"
  end

  create_table "parties", force: :cascade do |t|
    t.bigint "party_host_id"
    t.string "movie_title"
    t.integer "movie_id"
    t.date "date"
    t.time "duration"
    t.time "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_host_id"], name: "index_parties_on_party_host_id"
  end

  create_table "user_friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_user_friendships_on_friend_id"
    t.index ["user_id"], name: "index_user_friendships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendees", "parties"
  add_foreign_key "attendees", "users"
  add_foreign_key "parties", "users", column: "party_host_id"
  add_foreign_key "user_friendships", "users"
  add_foreign_key "user_friendships", "users", column: "friend_id"
end
