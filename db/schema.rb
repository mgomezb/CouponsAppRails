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

ActiveRecord::Schema.define(version: 20150129044544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beacons", force: true do |t|
    t.integer  "major"
    t.integer  "minor"
    t.string   "proximity_uuid"
    t.string   "description"
    t.integer  "local_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "beacons", ["local_id"], name: "index_beacons_on_local_id", using: :btree

  create_table "beacons_coupons", force: true do |t|
    t.integer "beacon_id"
    t.integer "coupon_id"
  end

  create_table "beacons_notifications", force: true do |t|
    t.integer "beacon_id"
    t.integer "notification_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupons", force: true do |t|
    t.string   "title"
    t.text     "message"
    t.datetime "init_date"
    t.datetime "end_date"
    t.string   "access_level"
    t.text     "legal"
    t.integer  "proximity_trigger_range"
    t.string   "code"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "stock"
    t.integer  "category"
    t.string   "use_instructions"
  end

  add_index "coupons", ["store_id"], name: "index_coupons_on_store_id", using: :btree

  create_table "date_updates", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "local_stores", force: true do |t|
    t.integer  "local_id"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locals", force: true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "radius"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.string   "title"
    t.text     "message"
    t.datetime "init_date"
    t.datetime "end_date"
    t.integer  "proximity_trigger_range"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "local_id"
    t.string   "access_level"
  end

  create_table "stores", force: true do |t|
    t.string   "name"
    t.integer  "local_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stores", ["local_id"], name: "index_stores_on_local_id", using: :btree

  create_table "user_locals", force: true do |t|
    t.integer  "user_id"
    t.integer  "local_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "name"
    t.string   "last_name"
    t.string   "rut"
    t.string   "address"
    t.string   "gender"
    t.string   "authentication_token"
    t.string   "user_type"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_coupons", force: true do |t|
    t.integer "user_id"
    t.integer "coupon_id"
  end

end
