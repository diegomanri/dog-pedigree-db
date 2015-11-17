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

ActiveRecord::Schema.define(version: 20151117170244) do

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id",    limit: 4
    t.integer  "recipient_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dogs", force: :cascade do |t|
    t.string   "dname",      limit: 255
    t.string   "breed",      limit: 255
    t.string   "variety",    limit: 255
    t.date     "dob"
    t.string   "height",     limit: 255
    t.string   "weight",     limit: 255
    t.string   "pedinum",    limit: 255
    t.string   "occupation", limit: 255
    t.string   "workcert",   limit: 255
    t.string   "health",     limit: 255
    t.text     "dcomments",  limit: 65535
    t.string   "avatar",     limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "avatar_url", limit: 255
    t.string   "sex",        limit: 255
  end

  add_index "dogs", ["dname", "user_id"], name: "index_dogs_on_dname_and_user_id", using: :btree
  add_index "dogs", ["user_id"], name: "index_dogs_on_user_id", using: :btree

  create_table "event_registrations", force: :cascade do |t|
    t.integer  "event_id",    limit: 4
    t.integer  "attendee_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "event_registrations", ["attendee_id", "event_id"], name: "index_event_registrations_on_attendee_id_and_event_id", using: :btree
  add_index "event_registrations", ["attendee_id"], name: "index_event_registrations_on_attendee_id", using: :btree
  add_index "event_registrations", ["event_id"], name: "index_event_registrations_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "ename",        limit: 255
    t.date     "edate"
    t.time     "etime"
    t.text     "edescription", limit: 65535
    t.string   "estateprov",   limit: 255
    t.string   "ecity",        limit: 255
    t.string   "ezippostal",   limit: 255
    t.string   "ecountry",     limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "time_zone",    limit: 255
    t.string   "avatar",       limit: 255
    t.string   "avatar_url",   limit: 255
    t.integer  "creator_id",   limit: 4
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body",            limit: 65535
    t.integer  "conversation_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.boolean  "read",                          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "pedigrees", force: :cascade do |t|
    t.integer "dog_id",        limit: 4
    t.integer "relative_id",   limit: 4
    t.string  "relation_name", limit: 255, default: "Sibling", null: false
  end

  add_index "pedigrees", ["dog_id", "relative_id", "relation_name"], name: "index_pedigrees_on_dog_id_and_relative_id_and_relation_name", using: :btree
  add_index "pedigrees", ["dog_id"], name: "index_pedigrees_on_dog_id", using: :btree
  add_index "pedigrees", ["relative_id"], name: "index_pedigrees_on_relative_id", using: :btree

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

  add_foreign_key "dogs", "users"
  add_foreign_key "event_registrations", "events"
  add_foreign_key "pedigrees", "dogs"
end
