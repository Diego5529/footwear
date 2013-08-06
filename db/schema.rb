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

ActiveRecord::Schema.define(:version => 20130806144419) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "cpf"
    t.string   "zip_code"
    t.string   "address"
    t.string   "number"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.string   "telephone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "enterprises", :force => true do |t|
    t.string   "name"
    t.string   "name_social"
    t.string   "email"
    t.string   "password"
    t.string   "cnpj"
    t.string   "zip_code"
    t.string   "address"
    t.string   "number"
    t.string   "district"
    t.string   "state"
    t.string   "city"
    t.string   "telephone"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "imageable_id"
    t.string   "imageable_type"
  end

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "shoe_id"
    t.decimal  "value",      :precision => 10, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "orders", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name",       :limit => 50,  :null => false
    t.string   "email",      :limit => 100
    t.string   "password",   :limit => 50,  :null => false
    t.boolean  "admin"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shoes", :force => true do |t|
    t.string   "name"
    t.decimal  "value",         :precision => 10, :scale => 2
    t.integer  "enterprise_id"
    t.string   "audience"
    t.date     "registed"
    t.text     "description"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.integer  "stock"
    t.integer  "lock_version",                                 :default => 0
  end

end
