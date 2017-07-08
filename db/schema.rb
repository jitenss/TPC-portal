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

ActiveRecord::Schema.define(version: 20170629151205) do

  create_table "companies", force: :cascade do |t|
    t.string   "cin",                limit: 255,                   null: false
    t.string   "c_name",             limit: 255,                   null: false
    t.float    "cpiCriteria",        limit: 24,                    null: false
    t.string   "category",           limit: 255,                   null: false
    t.integer  "batch",              limit: 4
    t.text     "info",               limit: 65535
    t.integer  "c_backlogs",         limit: 4,                     null: false
    t.text     "skills_set",         limit: 65535
    t.boolean  "visiting",                         default: false
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "no_placed_students", limit: 4
    t.text     "feedback",           limit: 65535
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "companies", ["c_name"], name: "index_companies_on_c_name", using: :btree

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

  create_table "student_details", force: :cascade do |t|
    t.string   "s_name",        limit: 255, null: false
    t.integer  "batch",         limit: 4,   null: false
    t.string   "roll_no",       limit: 255, null: false
    t.string   "branch",        limit: 255, null: false
    t.string   "gender",        limit: 255, null: false
    t.date     "date_of_birth",             null: false
    t.string   "contact_no_1",  limit: 255, null: false
    t.string   "contact_no_2",  limit: 255
    t.integer  "s_backlogs",    limit: 4,   null: false
    t.string   "email",         limit: 255, null: false
    t.float    "spi_1",         limit: 24,  null: false
    t.float    "spi_2",         limit: 24,  null: false
    t.float    "spi_3",         limit: 24,  null: false
    t.float    "spi_4",         limit: 24,  null: false
    t.float    "spi_5",         limit: 24,  null: false
    t.float    "spi_6",         limit: 24,  null: false
    t.float    "spi_7",         limit: 24
    t.float    "cpi_6",         limit: 24,  null: false
    t.float    "cpi_7",         limit: 24
    t.float    "percent_10",    limit: 24,  null: false
    t.float    "percent_12",    limit: 24,  null: false
    t.string   "resume",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "student_details", ["roll_no"], name: "index_student_details_on_roll_no", using: :btree

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

  create_table "tpc_members", force: :cascade do |t|
    t.string   "t_roll_no",       limit: 255
    t.string   "t_name",          limit: 255
    t.integer  "t_batch",         limit: 4
    t.string   "team",            limit: 255
    t.date     "date_of_joining"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "tpc_members", ["t_roll_no"], name: "index_tpc_members_on_t_roll_no", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "category",               limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "company_branches", "companies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "company_ctcs", "companies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_placeds", "companies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_placeds", "student_registers", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_registers", "companies", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_registers", "student_details", on_update: :cascade, on_delete: :cascade
end
