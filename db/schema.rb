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

ActiveRecord::Schema.define(version: 20170609173928) do

  create_table "companies", force: :cascade do |t|
    t.string   "c_name",      limit: 255,   null: false
    t.float    "cpiCriteria", limit: 24,    null: false
    t.string   "category",    limit: 255,   null: false
    t.text     "info",        limit: 65535
    t.string   "backlogs",    limit: 255,   null: false
    t.text     "skills_set",  limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "company_branches", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "branch",     limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "company_branches", ["company_id"], name: "fk_rails_9e51ae5a43", using: :btree

  create_table "company_ctcs", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "position",   limit: 255, null: false
    t.float    "ctc_lakhs",  limit: 24,  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "company_ctcs", ["company_id"], name: "fk_rails_171acc10b7", using: :btree

  create_table "company_drives", force: :cascade do |t|
    t.integer  "company_id",         limit: 4
    t.string   "c_name",             limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "no_placed_students", limit: 4
    t.text     "feedback",           limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "company_drives", ["company_id"], name: "fk_rails_91870e76ba", using: :btree

  create_table "student_details", force: :cascade do |t|
    t.string   "s_name",        limit: 255, null: false
    t.integer  "batch",         limit: 4,   null: false
    t.string   "roll_no",       limit: 255, null: false
    t.string   "branch",        limit: 255, null: false
    t.string   "gender",        limit: 255, null: false
    t.date     "date_of_birth",             null: false
    t.integer  "contact_no_1",  limit: 4,   null: false
    t.integer  "contact_no_2",  limit: 4
    t.string   "email",         limit: 255, null: false
    t.float    "spi_1",         limit: 24,  null: false
    t.float    "spi_2",         limit: 24,  null: false
    t.float    "spi_3",         limit: 24,  null: false
    t.float    "spi_4",         limit: 24,  null: false
    t.float    "spi_5",         limit: 24,  null: false
    t.float    "spi_6",         limit: 24,  null: false
    t.float    "spi_7",         limit: 24
    t.float    "cpi_7",         limit: 24
    t.float    "10_percent",    limit: 24,  null: false
    t.float    "12_percent",    limit: 24,  null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "company_branches", "companies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "company_ctcs", "companies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "company_drives", "companies", on_update: :cascade, on_delete: :cascade
end
