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

ActiveRecord::Schema.define(version: 20150501095345) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "actions", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "user_ip",    limit: 255
    t.integer  "action_num", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "kind",       limit: 255
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "ahoy_events", force: :cascade do |t|
    t.binary   "visit_id",   limit: 16
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.text     "properties", limit: 65535
    t.datetime "time"
  end

  add_index "ahoy_events", ["time"], name: "index_ahoy_events_on_time", using: :btree
  add_index "ahoy_events", ["user_id"], name: "index_ahoy_events_on_user_id", using: :btree
  add_index "ahoy_events", ["visit_id"], name: "index_ahoy_events_on_visit_id", using: :btree

  create_table "change_location_id_to_locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finding_post_reports", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "finding_post_id", limit: 4
    t.string   "kind",            limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "finding_posts", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "description",   limit: 255
    t.string   "special_signs", limit: 255
    t.integer  "age",           limit: 4
    t.string   "image",         limit: 255
    t.string   "contact_info",  limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id",       limit: 4
    t.boolean  "status",        limit: 1
    t.integer  "location_id",   limit: 4
    t.string   "gender",        limit: 255
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name_ar",    limit: 255
  end

  create_table "missing_post_reports", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "missing_post_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "kind",            limit: 255
  end

  create_table "missing_posts", force: :cascade do |t|
    t.integer  "age",            limit: 4
    t.string   "reporter_name",  limit: 255
    t.string   "reporter_phone", limit: 255
    t.string   "description",    limit: 255
    t.string   "image",          limit: 255
    t.string   "special_signs",  limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id",        limit: 4
    t.boolean  "status",         limit: 1
    t.integer  "location_id",    limit: 4
    t.string   "gender",         limit: 255
  end

  create_table "spammers", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "user_ip",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "kind",       limit: 255
  end

  create_table "suspect_post_reports", force: :cascade do |t|
    t.integer  "suspect_post_id", limit: 4
    t.string   "kind",            limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "suspect_posts", force: :cascade do |t|
    t.string   "approximate_age", limit: 255
    t.string   "gender",          limit: 255
    t.string   "description",     limit: 255
    t.string   "special_signs",   limit: 255
    t.string   "reporter_name",   limit: 255
    t.string   "reporter_phone",  limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "image",           limit: 255
    t.integer  "location_id",     limit: 4
    t.string   "ip",              limit: 255
  end

  create_table "telephones", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "number",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "visits", force: :cascade do |t|
    t.binary   "visitor_id",       limit: 16
    t.string   "ip",               limit: 255
    t.text     "user_agent",       limit: 65535
    t.text     "referrer",         limit: 65535
    t.text     "landing_page",     limit: 65535
    t.integer  "user_id",          limit: 4
    t.string   "referring_domain", limit: 255
    t.string   "search_keyword",   limit: 255
    t.string   "browser",          limit: 255
    t.string   "os",               limit: 255
    t.string   "device_type",      limit: 255
    t.integer  "screen_height",    limit: 4
    t.integer  "screen_width",     limit: 4
    t.string   "country",          limit: 255
    t.string   "region",           limit: 255
    t.string   "city",             limit: 255
    t.string   "utm_source",       limit: 255
    t.string   "utm_medium",       limit: 255
    t.string   "utm_term",         limit: 255
    t.string   "utm_content",      limit: 255
    t.string   "utm_campaign",     limit: 255
    t.datetime "started_at"
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree

end
