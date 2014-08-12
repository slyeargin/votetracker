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

ActiveRecord::Schema.define(version: 20140812095200) do

  create_table "bills", force: true do |t|
    t.string "bill_number"
    t.text   "name"
    t.text   "description"
    t.string "floor_vote_date"
  end

  create_table "legislators", force: true do |t|
    t.string  "name"
    t.string  "hometown"
    t.integer "district_number"
    t.string  "party_affiliation"
    t.string  "governing_body"
  end

  create_table "sponsors", force: true do |t|
    t.integer "bill_id"
    t.integer "legislator_id"
  end

  add_index "sponsors", ["bill_id"], name: "index_sponsors_on_bill_id"
  add_index "sponsors", ["legislator_id"], name: "index_sponsors_on_legislator_id"

  create_table "votes", force: true do |t|
    t.string "bill_number"
    t.string "legislator_name"
    t.string "vote_status"
  end

end
