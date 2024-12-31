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

ActiveRecord::Schema[7.2].define(version: 2024_12_31_113113) do
  create_table "admins", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "admins_announcements", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.text "content"
    t.integer "number", default: 0, null: false
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_articles_on_number"
    t.index ["title"], name: "index_articles_on_title"
  end

  create_table "bureau_articles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "bureau_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_bureau_articles_on_article_id"
    t.index ["bureau_id", "article_id"], name: "index_bureau_articles_on_bureau_id_and_article_id", unique: true
    t.index ["bureau_id"], name: "index_bureau_articles_on_bureau_id"
  end

  create_table "bureaus", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description", default: "", null: false
    t.index ["name"], name: "index_bureaus_on_name", unique: true
    t.index ["slug"], name: "index_bureaus_on_slug", unique: true
  end

  create_table "committee_article_tags", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "committee_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_committee_article_tags_on_article_id"
    t.index ["committee_id", "article_id"], name: "index_committee_article_tags_on_committee_id_and_article_id", unique: true
    t.index ["committee_id"], name: "index_committee_article_tags_on_committee_id"
  end

  create_table "committees", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "description", default: "", null: false
    t.text "content"
    t.bigint "bureau_id"
    t.boolean "special", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bureau_id"], name: "index_committees_on_bureau_id"
    t.index ["name"], name: "index_committees_on_name", unique: true
    t.index ["slug"], name: "index_committees_on_slug", unique: true
  end

  create_table "event_cart_carts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", comment: "カート", force: :cascade do |t|
    t.string "name", null: false, comment: "イベント名"
    t.date "held_at", null: false, comment: "開催日"
    t.string "place", comment: "会場"
    t.string "atlas", comment: "会場の地図"
    t.text "memo", comment: "メモ"
    t.string "unique_code", null: false, comment: "ユニークコード"
    t.boolean "disabled", default: false, null: false, comment: "無効化"
    t.datetime "disabled_at", comment: "無効化日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unique_code"], name: "index_event_cart_carts_on_unique_code", unique: true
  end

  create_table "versions", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "item_type", limit: 191, null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", size: :long
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "bureau_articles", "articles"
  add_foreign_key "bureau_articles", "bureaus"
  add_foreign_key "committee_article_tags", "articles"
  add_foreign_key "committee_article_tags", "committees"
  add_foreign_key "committees", "bureaus"
end
