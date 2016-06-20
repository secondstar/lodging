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

ActiveRecord::Schema.define(version: 20160614183731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "foursquare_reviews", force: :cascade do |t|
    t.string   "foursquare_id"
    t.string   "name"
    t.string   "address"
    t.string   "cross_street"
    t.string   "lat"
    t.string   "lng"
    t.string   "alt_venues"
    t.string   "searched_for"
    t.datetime "archived_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state_code"
    t.string   "zip_code"
    t.string   "phone_number"
    t.string   "url"
    t.boolean  "off_site"
    t.boolean  "water_sports"
    t.boolean  "marina"
    t.boolean  "beach"
    t.boolean  "tennis"
    t.boolean  "biking"
    t.boolean  "suites"
    t.boolean  "concierge_floor"
    t.boolean  "room_service"
    t.boolean  "wired_internet"
    t.boolean  "wireless_internet"
    t.integer  "num_rooms"
    t.string   "cost_range"
    t.string   "shuttle_to_parks"
    t.string   "cost_estimate"
    t.string   "lodging_area_code"
    t.string   "category_code"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "permalink"
    t.string   "theme"
  end

  create_table "touring_plans_hotels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "permalink"
  end

end
