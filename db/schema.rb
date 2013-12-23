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

ActiveRecord::Schema.define(version: 20131223164113) do

  create_table "departments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_logs", force: true do |t|
    t.integer  "imported_job_count"
    t.string   "imported_job_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_postings", force: true do |t|
    t.string   "title"
    t.datetime "published"
    t.string   "link"
    t.text     "description"
    t.integer  "osu_job_id"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_postings", ["department_id"], name: "index_job_postings_on_department_id"

end
