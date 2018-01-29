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

ActiveRecord::Schema.define(version: 20180129170703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.string "link"
    t.string "images"
    t.string "video"
    t.boolean "is_spam", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "report_id"
    t.index ["report_id"], name: "index_posts_on_report_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "posts_tags", id: false, force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "tag_id", null: false
    t.index ["post_id", "tag_id"], name: "index_posts_tags_on_post_id_and_tag_id"
    t.index ["tag_id", "post_id"], name: "index_posts_tags_on_tag_id_and_post_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "reason"
    t.bigint "user_id"
    t.string "screenshot"
    t.string "link"
    t.integer "authenticity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.integer "authenticity"
    t.string "logo"
    t.string "description"
    t.string "domain"
    t.boolean "secure_connection"
    t.boolean "verified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "total_mentions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trusts", force: :cascade do |t|
    t.bigint "source_id"
    t.bigint "user_id"
    t.string "screenshot"
    t.string "link"
    t.integer "authenticity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_trusts_on_source_id"
    t.index ["user_id"], name: "index_trusts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.float "truthiness", default: 10.0
    t.boolean "silenced", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "posts", "reports"
  add_foreign_key "posts", "users"
  add_foreign_key "reports", "users"
  add_foreign_key "trusts", "sources"
  add_foreign_key "trusts", "users"
end
