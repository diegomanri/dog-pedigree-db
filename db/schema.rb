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

ActiveRecord::Schema.define(version: 20151001230653) do

  create_table "users", force: :cascade do |t|
    t.string   "ufname",          limit: 50
    t.string   "umname",          limit: 20
    t.string   "ulname",          limit: 50
    t.string   "uemail",          limit: 100
    t.string   "username",        limit: 25
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "email_confirmed",             default: false
    t.string   "confirm_token",   limit: 255
    t.integer  "role",            limit: 4
    t.string   "reset_digest",    limit: 255
    t.datetime "reset_set_at"
    t.string   "city",            limit: 255
    t.string   "state",           limit: 255
    t.string   "zip",             limit: 255
  end

end
