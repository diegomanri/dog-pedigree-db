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

ActiveRecord::Schema.define(version: 20150922030114) do

  create_table "owners", force: :cascade do |t|
    t.string   "ofname",     limit: 255
    t.string   "omname",     limit: 255
    t.string   "olname",     limit: 255
    t.string   "opnumber",   limit: 255
    t.string   "oemail",     limit: 255
    t.string   "ocity",      limit: 255
    t.string   "ozip",       limit: 255
    t.string   "ostate",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "ufname",          limit: 50
    t.string   "umname",          limit: 20
    t.string   "ulname",          limit: 50
    t.string   "uemail",          limit: 100
    t.string   "username",        limit: 25
    t.string   "password_digest", limit: 255
    t.boolean  "admin",                       default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

end
