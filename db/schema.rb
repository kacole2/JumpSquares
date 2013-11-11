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

ActiveRecord::Schema.define(version: 20131110233301) do

  create_table "apptypes", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jumpsizes", force: true do |t|
    t.string   "size"
    t.integer  "length1"
    t.integer  "length2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "jumpsizecreator"
    t.integer  "itemsperpage"
  end

  create_table "jumpsquares", force: true do |t|
    t.string   "name"
    t.integer  "apptype"
    t.string   "url"
    t.string   "ipordns"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tag"
    t.string   "jscreator"
  end

  create_table "jumpsquares_tags", force: true do |t|
    t.integer "jumpsquare_id"
    t.integer "tag_id"
  end

  create_table "tags", force: true do |t|
    t.string   "tagname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tagcreator"
  end

end
