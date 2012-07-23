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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120717033711) do

  create_table "donations", :force => true do |t|
    t.date     "date_donated"
    t.decimal  "amount"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "donors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "limited_address"
    t.text     "bio"
    t.binary   "image"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "when"
    t.string   "city"
    t.string   "state"
    t.text     "description"
    t.integer  "number_of_volunteers_needed"
    t.binary   "image"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "category"
    t.string   "animal_type"
    t.string   "condition"
    t.decimal  "estimated_value"
    t.date     "expiration_date"
    t.text     "description"
    t.binary   "image"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "organizations", :force => true do |t|
    t.string   "organization_name"
    t.string   "representative_name"
    t.string   "email"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "limited_address"
    t.string   "website"
    t.text     "organization_description"
    t.binary   "image"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "role"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "wishlist_items", :force => true do |t|
    t.integer  "quantity"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
