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

ActiveRecord::Schema.define(version: 2019_02_12_221724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.string "country"
    t.boolean "approved", default: false, null: false
    t.text "description"
  end

  create_table "incenses", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "line_id"
    t.index ["line_id"], name: "index_incenses_on_line_id"
  end

  create_table "lines", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "brand_id"
    t.boolean "approved", default: false, null: false
    t.text "description"
    t.index ["brand_id"], name: "index_lines_on_brand_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sweet", null: false
    t.integer "sour", null: false
    t.integer "salty", null: false
    t.integer "bitter", null: false
    t.integer "umami", null: false
    t.integer "spice", null: false
    t.integer "woody", null: false
    t.integer "minutes", null: false
    t.string "season"
    t.text "review_text"
    t.bigint "incense_id"
    t.index ["incense_id"], name: "index_reviews_on_incense_id"
  end

  add_foreign_key "incenses", "lines"
  add_foreign_key "lines", "brands"
  add_foreign_key "reviews", "incenses"
end
