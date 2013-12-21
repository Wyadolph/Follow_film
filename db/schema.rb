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

ActiveRecord::Schema.define(version: 20131221102657) do

  create_table "films", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films_locations", force: true do |t|
    t.integer  "location_id"
    t.integer  "film_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films_users", id: false, force: true do |t|
    t.integer "user_id", null: false
    t.integer "film_id", null: false
  end

  create_table "followships", force: true do |t|
    t.integer  "user_id"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.float    "log"
    t.float    "lat"
    t.integer  "film_id"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes_locations", force: true do |t|
    t.integer  "route_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes_users", id: false, force: true do |t|
    t.integer "user_id",  null: false
    t.integer "route_id", null: false
  end

  create_table "sections", force: true do |t|
    t.string   "name"
    t.string   "content"
    t.integer  "film_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "film_id"
    t.integer  "route_id"
    t.integer  "current_route_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "users_films", force: true do |t|
    t.integer  "user_id"
    t.integer  "film_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_routes", force: true do |t|
    t.integer  "user_id"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
