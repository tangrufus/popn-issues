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

ActiveRecord::Schema.define(version: 20150809192031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "body",       null: false
    t.integer  "user_id",    null: false
    t.integer  "issue_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["issue_id"], name: "index_comments_on_issue_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "issues", force: :cascade do |t|
    t.string   "title",                  null: false
    t.integer  "status",     default: 0, null: false
    t.integer  "user_id",                null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "issues", ["status"], name: "index_issues_on_status", using: :btree
  add_index "issues", ["title"], name: "index_issues_on_title", unique: true, using: :btree
  add_index "issues", ["user_id"], name: "index_issues_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "title",           null: false
    t.datetime "published_at",    null: false
    t.datetime "modified_at",     null: false
    t.string   "link",            null: false
    t.text     "excerpt"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "purged_at"
    t.string   "host",            null: false
    t.datetime "posted_to_fb_at"
  end

  add_index "posts", ["host"], name: "index_posts_on_host", using: :btree
  add_index "posts", ["link"], name: "index_posts_on_link", unique: true, using: :btree
  add_index "posts", ["modified_at"], name: "index_posts_on_modified_at", using: :btree
  add_index "posts", ["published_at"], name: "index_posts_on_published_at", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "term_id",    null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["post_id"], name: "index_taggings_on_post_id", using: :btree
  add_index "taggings", ["term_id"], name: "index_taggings_on_term_id", using: :btree

  create_table "terms", force: :cascade do |t|
    t.string   "slug",       null: false
    t.string   "host",       null: false
    t.integer  "taxonomy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "father",     null: false
    t.string   "url"
    t.datetime "purged_at"
    t.string   "name"
  end

  add_index "terms", ["host", "slug", "taxonomy"], name: "index_terms_on_host_and_slug_and_taxonomy", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                   default: "",    null: false
    t.string   "encrypted_password",      default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",         default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "username"
    t.boolean  "subscribe_new_issues",    default: true,  null: false
    t.boolean  "subscribe_urgent_issues", default: false, null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["subscribe_new_issues"], name: "index_users_on_subscribe_new_issues", using: :btree
  add_index "users", ["subscribe_urgent_issues"], name: "index_users_on_subscribe_urgent_issues", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "wikis", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "body",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wikis", ["title"], name: "index_wikis_on_title", unique: true, using: :btree
  add_index "wikis", ["user_id"], name: "index_wikis_on_user_id", using: :btree

  add_foreign_key "taggings", "posts", on_delete: :cascade
end
