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

ActiveRecord::Schema.define(version: 20141115071117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_image_url"
    t.string   "authentication_token"
  end

  add_index "artists", ["authentication_token"], name: "index_artists_on_authentication_token", unique: true, using: :btree
  add_index "artists", ["email"], name: "index_artists_on_email", unique: true, using: :btree
  add_index "artists", ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true, using: :btree

  create_table "competitors", force: true do |t|
    t.integer "vendor_id"
    t.integer "competitor_id"
    t.integer "intensity"
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["user_id", "tag_id"], name: "index_favorites_on_user_id_and_tag_id", unique: true, using: :btree

  create_table "hotels", force: true do |t|
    t.string   "name"
    t.string   "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", force: true do |t|
    t.string   "description"
    t.string   "summary"
    t.string   "terms"
    t.datetime "expiration"
    t.integer  "value"
    t.integer  "pre_qualification_id"
    t.boolean  "converted"
  end

  add_index "offers", ["pre_qualification_id"], name: "index_offers_on_pre_qualification_id", using: :btree

  create_table "pre_qualifications", force: true do |t|
    t.integer  "user_id"
    t.integer  "vendor_id"
    t.boolean  "assigned"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pre_qualifications", ["user_id", "vendor_id"], name: "index_pre_qualifications_on_user_id_and_vendor_id", unique: true, using: :btree

  create_table "proposals", force: true do |t|
    t.string   "image_url"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "suggestion_id"
  end

  create_table "suggestions", force: true do |t|
    t.string   "address"
    t.string   "canvas_type"
    t.string   "city"
    t.string   "image_url"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.decimal  "latitude",    precision: 10, scale: 6
    t.decimal  "longitude",   precision: 10, scale: 6
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "suggestions", ["user_id"], name: "index_suggestions_on_user_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "title"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.decimal  "latitude",    precision: 10, scale: 6
    t.decimal  "longitude",   precision: 10, scale: 6
    t.string   "image_url"
    t.integer  "artist_id"
    t.string   "canvas_type"
    t.string   "country"
    t.integer  "user_id"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["artist_id"], name: "index_tags_on_artist_id", using: :btree

  create_table "upvotes", force: true do |t|
    t.integer  "suggestion_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "upvotes", ["suggestion_id", "user_id"], name: "index_upvotes_on_suggestion_id_and_user_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
    t.string   "profile_image_url"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vendors", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vendor_type"
    t.string   "description"
    t.string   "thumbnail"
    t.text     "summary"
    t.string   "phone_number"
    t.string   "website_url"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
  end

end
