# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_10_12_230034) do
  create_table "blog_comments", force: :cascade do |t|
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.string "email"
    t.integer "entry_id", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.string "url"
    t.integer "user_id"
    t.index ["entry_id"], name: "index_blog_comments_on_entry_id"
    t.index ["user_id"], name: "index_blog_comments_on_user_id"
  end

  create_table "blog_entries", force: :cascade do |t|
    t.text "body_html", null: false
    t.text "body_markdown", null: false
    t.datetime "created_at", null: false
    t.boolean "draft", default: true, null: false
    t.datetime "published_at"
    t.string "slug", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_media_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_taggings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "entry_id", null: false
    t.integer "tag_id", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_blog_taggings_on_entry_id"
    t.index ["tag_id"], name: "index_blog_taggings_on_tag_id"
  end

  create_table "blog_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "blog_comments", "entries"
  add_foreign_key "blog_comments", "users"
  add_foreign_key "blog_taggings", "entries"
  add_foreign_key "blog_taggings", "tags"
end
