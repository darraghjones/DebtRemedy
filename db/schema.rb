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

ActiveRecord::Schema.define(:version => 20101218010629) do

  create_table "client_answers", :force => true do |t|
    t.string   "value"
    t.integer  "client_id"
    t.integer  "data_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_debts", :force => true do |t|
    t.string   "creditor"
    t.string   "type"
    t.string   "owner"
    t.string   "balance"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "web_number"
    t.date     "last_login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_items", :force => true do |t|
    t.string   "name"
    t.string   "default_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
