# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160125211053) do

  create_table "places", force: :cascade do |t|
    t.integer "moves_id"
    t.string  "name"
    t.string  "place_type"
    t.float   "location_lat"
    t.float   "location_lon"
    t.string  "foursquare_id"
    t.integer "user_id"
  end

  add_index "places", ["user_id"], name: "index_places_on_user_id"

  create_table "segments", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "last_update"
    t.integer  "place_id"
  end

  add_index "segments", ["place_id"], name: "index_segments_on_place_id"

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "platform"
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "from_date"
    t.string   "access_token"
    t.string   "refresh_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["uid"], name: "index_users_on_uid"

end
