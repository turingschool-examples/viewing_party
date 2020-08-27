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

ActiveRecord::Schema.define(version: 2020_08_26_212347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "user_view_parties", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "view_party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "attending", default: false
    t.index ["user_id"], name: "index_user_view_parties_on_user_id"
    t.index ["view_party_id"], name: "index_user_view_parties_on_view_party_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "google_token"
    t.string "google_refresh_token"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "view_parties", force: :cascade do |t|
    t.string "movie_title"
    t.string "date"
    t.string "time"
    t.string "runtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "friendships", "users"
  add_foreign_key "user_view_parties", "users"
  add_foreign_key "user_view_parties", "view_parties"
end
