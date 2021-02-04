ActiveRecord::Schema.define(version: 2021_02_04_185045) do 
  enable_extension "plpgsql"

  create_table "friends", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "request_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.integer "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "movie_id"
    t.date "scheduled_date"
    t.time "start_time"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_parties_on_movie_id"
    t.index ["user_id"], name: "index_parties_on_user_id"
  end

  create_table "user_parties", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "party_id"
    t.integer "attendee_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_user_parties_on_party_id"
    t.index ["user_id"], name: "index_user_parties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "friends", "users", column: "receiver_id"
  add_foreign_key "friends", "users", column: "sender_id"
  add_foreign_key "parties", "movies"
  add_foreign_key "parties", "users"
  add_foreign_key "user_parties", "parties"
  add_foreign_key "user_parties", "users"
end
