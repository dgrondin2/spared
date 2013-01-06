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

ActiveRecord::Schema.define(:version => 20130106005457) do

  create_table "donations", :force => true do |t|
    t.date     "date_donated"
    t.decimal  "amount"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "donor_id"
  end

# Could not dump table "donors" because of following StandardError
#   Unknown type 'attachment' for column 'avatar'

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_time"
    t.string   "city"
    t.string   "state"
    t.text     "description"
    t.integer  "number_of_volunteers_needed"
    t.binary   "image"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "donor_id"
  end

  create_table "item_offers", :force => true do |t|
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
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "donor_id"
  end

  create_table "organizations", :force => true do |t|
    t.string   "organization_name"
    t.string   "representative_name"
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

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.integer  "donor_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "volunteers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
