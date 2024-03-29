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

ActiveRecord::Schema.define(version: 20140913161450) do

  create_table "events", force: true do |t|
    t.date     "date"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "text"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["event_id"], name: "index_questions_on_event_id"

  create_table "timeline_events", id: false, force: true do |t|
    t.integer "event_id",    null: false
    t.integer "timeline_id", null: false
  end

  add_index "timeline_events", ["event_id", "timeline_id"], name: "index_timeline_events_on_event_id_and_timeline_id"
  add_index "timeline_events", ["timeline_id", "event_id"], name: "index_timeline_events_on_timeline_id_and_event_id", unique: true

  create_table "timelines", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
