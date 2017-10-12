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

ActiveRecord::Schema.define(version: 20171011011341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cached_flickr_photo_sizes", force: :cascade do |t|
    t.string   "label"
    t.string   "width"
    t.string   "height"
    t.text     "source"
    t.text     "url"
    t.string   "media"
    t.integer  "cached_flickr_photo_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "width_by_height"
  end

  add_index "cached_flickr_photo_sizes", ["cached_flickr_photo_id"], name: "index_cached_flickr_photo_sizes_on_cached_flickr_photo_id", using: :btree

  create_table "cached_flickr_photos", force: :cascade do |t|
    t.string   "owner"
    t.string   "secret"
    t.string   "server"
    t.integer  "farm"
    t.string   "title"
    t.boolean  "ispublic"
    t.boolean  "isfriend"
    t.boolean  "isfamily"
    t.integer  "hotel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "flickr_id"
    t.text     "description_content"
    t.integer  "rotation"
    t.string   "originalformat"
    t.integer  "haspeople"
  end

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

  create_table "flickr_search_filters", force: :cascade do |t|
    t.string   "user_id"
    t.string   "tags"
    t.string   "tag_mode"
    t.string   "text"
    t.string   "min_upload_date"
    t.string   "max_upload_date"
    t.string   "min_taken_date"
    t.string   "max_taken_date"
    t.string   "license"
    t.string   "sort"
    t.string   "privacy_filter"
    t.string   "bbox"
    t.string   "accuracy"
    t.string   "safe_search"
    t.string   "content_type"
    t.string   "machine_tags"
    t.string   "machine_tag_mode"
    t.string   "group_id"
    t.string   "faves"
    t.string   "camera"
    t.string   "jump_to"
    t.string   "contacts"
    t.string   "woe_id"
    t.string   "place_id"
    t.string   "media"
    t.string   "has_geo"
    t.string   "geo_context"
    t.string   "lat"
    t.string   "lon"
    t.string   "radius"
    t.string   "radius_units"
    t.string   "is_commons"
    t.string   "in_gallery"
    t.string   "person_id"
    t.string   "is_getty"
    t.string   "username"
    t.string   "exif_min_exposure"
    t.string   "exif_max_exposure"
    t.string   "exif_min_aperture"
    t.string   "exif_max_aperture"
    t.string   "exif_min_focallen"
    t.string   "exif_max_focallen"
    t.string   "exclude_user_id"
    t.string   "extras"
    t.string   "per_page"
    t.string   "page"
    t.integer  "hotel_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "flickr_search_filters", ["hotel_id"], name: "index_flickr_search_filters_on_hotel_id", using: :btree

  create_table "foursquare_photos", force: :cascade do |t|
    t.string   "source"
    t.string   "prefix"
    t.string   "suffix"
    t.integer  "width"
    t.integer  "height"
    t.string   "visibility"
    t.string   "foursquare_user_id"
    t.string   "foursquare_photo_id"
    t.integer  "foursquare_review_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "foursquare_venue_id"
    t.string   "photographer_first_name"
    t.string   "photographer_last_name"
  end

  add_index "foursquare_photos", ["foursquare_review_id"], name: "index_foursquare_photos_on_foursquare_review_id", using: :btree

  create_table "foursquare_reviews", force: :cascade do |t|
    t.string   "venue_id"
    t.string   "name"
    t.string   "address"
    t.string   "cross_street"
    t.string   "lat"
    t.string   "lng"
    t.string   "alt_venues"
    t.string   "searched_for"
    t.datetime "archived_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.text     "categories"
    t.string   "referral_id"
    t.text     "location"
    t.text     "canonical_url"
    t.boolean  "verified"
    t.boolean  "dislike"
    t.boolean  "ok"
    t.decimal  "rating",              precision: 10, scale: 2
    t.string   "rating_color"
    t.string   "rating_signals"
    t.boolean  "allow_menu_url_edit"
    t.string   "specials"
    t.text     "wdw_uri"
    t.integer  "hotel_id"
  end

  add_index "foursquare_reviews", ["hotel_id"], name: "index_foursquare_reviews_on_hotel_id", using: :btree

  create_table "foursquare_tips", force: :cascade do |t|
    t.string   "venue_id"
    t.string   "text"
    t.string   "tip_kind"
    t.text     "canonical_url"
    t.string   "lang"
    t.text     "likes"
    t.integer  "agree_count"
    t.integer  "disagree_count"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "foursquare_review_id"
    t.string   "foursquare_id"
    t.string   "foursquare_author_id"
    t.string   "author_first_name"
    t.string   "author_last_name"
    t.string   "author_gender"
    t.string   "author_photo_prefix"
    t.string   "author_photo_suffix"
  end

  add_index "foursquare_tips", ["foursquare_review_id"], name: "index_foursquare_tips_on_foursquare_review_id", using: :btree

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state_code"
    t.string   "zip_code"
    t.string   "phone_number"
    t.string   "wdw_uri"
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
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.text     "permalink"
    t.string   "theme"
    t.string   "foursquare_venue_id"
  end

  create_table "paloozas", force: :cascade do |t|
    t.string   "name"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "touring_plans_hotels", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "permalink"
    t.string   "name"
    t.string   "wdw_uri"
    t.text     "address"
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
    t.string   "theme"
  end

  add_foreign_key "cached_flickr_photo_sizes", "cached_flickr_photos"
  add_foreign_key "flickr_search_filters", "hotels"
  add_foreign_key "foursquare_reviews", "hotels"
  add_foreign_key "foursquare_tips", "foursquare_reviews"
end
