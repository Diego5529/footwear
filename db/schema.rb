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

ActiveRecord::Schema.define(:version => 20130724163749) do

  create_table "enterprises", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.string   "name_social"
    t.string   "email",       :limit => 50, :null => false
    t.string   "password",    :limit => 50, :null => false
    t.string   "CNPJ",        :limit => 14, :null => false
    t.string   "CEP",         :limit => 8,  :null => false
    t.string   "address",     :limit => 50, :null => false
    t.string   "number",      :limit => 10, :null => false
    t.string   "district",    :limit => 50, :null => false
    t.string   "state",       :limit => 50, :null => false
    t.string   "city",        :limit => 50, :null => false
    t.string   "telephone",   :limit => 20, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name",       :limit => 50, :null => false
    t.string   "password",   :limit => 50
    t.boolean  "admin"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

end
