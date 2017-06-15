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

ActiveRecord::Schema.define(version: 20170610015612) do

  create_table "companies", force: :cascade do |t|
    t.string   "cin",         limit: 255,   null: false
    t.string   "c_name",      limit: 255,   null: false
    t.float    "cpiCriteria", limit: 24,    null: false
    t.string   "category",    limit: 255,   null: false
    t.integer  "batch",       limit: 4
    t.text     "info",        limit: 65535
    t.integer  "backlogs",    limit: 4,     null: false
    t.text     "skills_set",  limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "companies", ["cin"], name: "index_companies_on_cin", using: :btree

  create_table "company_branches", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "branch",     limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "company_branches", ["company_id"], name: "index_company_branches_on_company_id", using: :btree

  create_table "company_ctcs", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "position",   limit: 255, null: false
    t.float    "ctc",        limit: 24,  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "company_ctcs", ["company_id"], name: "index_company_ctcs_on_company_id", using: :btree

  create_table "company_drives", force: :cascade do |t|
    t.integer  "company_id",         limit: 4
    t.date     "start_date",                       null: false
    t.date     "end_date"
    t.integer  "no_placed_students", limit: 4,     null: false
    t.text     "feedback",           limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "company_drives", ["company_id"], name: "index_company_drives_on_company_id", using: :btree

  create_table "student_details", force: :cascade do |t|
    t.string   "s_name",          limit: 255, null: false
    t.integer  "batch",           limit: 4,   null: false
    t.string   "roll_no",         limit: 255, null: false
    t.string   "password_digest", limit: 255
    t.string   "branch",          limit: 255, null: false
    t.string   "gender",          limit: 255, null: false
    t.date     "date_of_birth",               null: false
    t.string   "contact_no_1",    limit: 255, null: false
    t.string   "contact_no_2",    limit: 255
    t.string   "email",           limit: 255, null: false
    t.float    "spi_1",           limit: 24,  null: false
    t.float    "spi_2",           limit: 24,  null: false
    t.float    "spi_3",           limit: 24,  null: false
    t.float    "spi_4",           limit: 24,  null: false
    t.float    "spi_5",           limit: 24,  null: false
    t.float    "spi_6",           limit: 24,  null: false
    t.float    "spi_7",           limit: 24
    t.float    "cpi_6",           limit: 24,  null: false
    t.float    "cpi_7",           limit: 24
    t.float    "percent_10",      limit: 24,  null: false
    t.float    "percent_12",      limit: 24,  null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "student_placeds", force: :cascade do |t|
    t.integer  "student_register_id", limit: 4
    t.integer  "company_id",          limit: 4
    t.integer  "ctc",                 limit: 4,   null: false
    t.string   "position",            limit: 255
    t.string   "type",                limit: 255, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "student_placeds", ["company_id"], name: "index_student_placeds_on_company_id", using: :btree
  add_index "student_placeds", ["student_register_id"], name: "index_student_placeds_on_student_register_id", using: :btree

  create_table "student_registers", force: :cascade do |t|
    t.integer  "student_detail_id", limit: 4
    t.integer  "company_id",        limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "student_registers", ["company_id"], name: "index_student_registers_on_company_id", using: :btree
  add_index "student_registers", ["student_detail_id"], name: "index_student_registers_on_student_detail_id", using: :btree

  add_foreign_key "company_branches", "companies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "company_ctcs", "companies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "company_drives", "companies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_placeds", "companies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_placeds", "student_registers", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_registers", "companies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_registers", "student_details", on_update: :cascade, on_delete: :cascade
end
