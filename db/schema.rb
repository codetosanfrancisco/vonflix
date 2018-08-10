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

ActiveRecord::Schema.define(version: 2018_08_10_103413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audios", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "details", force: :cascade do |t|
    t.text "adjective", default: [], array: true
    t.text "audio", default: [], array: true
    t.text "subtitle", default: [], array: true
    t.text "cast", default: [], array: true
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_details_on_movie_id"
  end

  create_table "histories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_histories_on_movie_id"
    t.index ["user_id"], name: "index_histories_on_user_id"
  end

  create_table "invitation_users", force: :cascade do |t|
    t.bigint "friend_id"
    t.bigint "invitation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_invitation_users_on_friend_id"
    t.index ["invitation_id"], name: "index_invitation_users_on_invitation_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "movie_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_invitations_on_movie_id"
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "user_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "video"
    t.string "title"
    t.string "year"
    t.string "age"
    t.integer "hour"
    t.integer "minute"
    t.text "starring", default: [], array: true
    t.integer "view"
    t.text "genres", default: [], array: true
    t.string "director"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "images"
  end

  create_table "playlist_movies", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "playlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_playlist_movies_on_movie_id"
    t.index ["playlist_id"], name: "index_playlist_movies_on_playlist_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "invitation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invitation_id"], name: "index_rooms_on_invitation_id"
  end

  create_table "subtitles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

  add_foreign_key "histories", "movies"
  add_foreign_key "histories", "users"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "playlist_movies", "movies"
  add_foreign_key "playlist_movies", "playlists"
  add_foreign_key "playlists", "users"
end
