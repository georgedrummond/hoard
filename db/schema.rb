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

ActiveRecord::Schema.define(version: 20140329015543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "releases", force: true do |t|
    t.integer  "rubygem_id"
    t.string   "name"
    t.string   "version"
    t.text     "description"
    t.text     "summary"
    t.string   "platform"
    t.date     "date"
    t.boolean  "prerelease"
    t.string   "number"
    t.string   "authors"
    t.string   "email"
    t.string   "dependencies"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rubygems", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "nickname"
    t.string   "name"
    t.string   "avatar_url"
    t.string   "github_id"
    t.string   "github_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
