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

ActiveRecord::Schema.define(version: 20160302050404) do

  create_table "relationships", force: :cascade do |t|
    t.integer  "favorited_id"
    t.integer  "favoriter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "relationships", ["favorited_id", "favoriter_id"], name: "index_relationships_on_favorited_id_and_favoriter_id", unique: true
  add_index "relationships", ["favorited_id"], name: "index_relationships_on_favorited_id"
  add_index "relationships", ["favoriter_id"], name: "index_relationships_on_favoriter_id"

  create_table "rivers", force: :cascade do |t|
    t.string   "name"
    t.string   "section"
    t.string   "difficulty"
    t.string   "usgs_id"
    t.text     "details"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "state"
    t.string   "put_in"
    t.string   "take_out"
    t.boolean  "approved",   default: false
  end

  add_index "rivers", ["name", "user_id"], name: "index_rivers_on_name_and_user_id"
  add_index "rivers", ["user_id"], name: "index_rivers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
