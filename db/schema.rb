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

ActiveRecord::Schema[7.1].define(version: 2024_06_12_031253) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "ip_address"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
    t.string "label"
    t.string "field_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "landing_page_id", null: false
    t.index ["landing_page_id"], name: "index_fields_on_landing_page_id"
  end

  create_table "landing_pages", force: :cascade do |t|
    t.string "destination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string "shortlink"
    t.string "link"
    t.integer "visit_count"
    t.boolean "editing", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links_visitors", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "visitor_id", null: false
    t.integer "visits"
  end

  create_table "visitors", force: :cascade do |t|
    t.string "ip_address"
    t.string "country"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fields", "landing_pages"
end
