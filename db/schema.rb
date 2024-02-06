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

ActiveRecord::Schema[7.1].define(version: 2024_02_06_202256) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "item_type", ["Product", "Component"]

  create_table "items", force: :cascade do |t|
    t.enum "item_type", default: "Product", null: false, enum_type: "item_type"
    t.string "identifier", null: false
    t.string "label", null: false
    t.string "description", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "menu_sections", force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.bigint "section_id", null: false
    t.integer "display_order", default: 0, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["display_order", "menu_id"], name: "index_menu_sections_on_display_order_and_menu_id", unique: true
    t.index ["menu_id", "section_id"], name: "index_menu_sections_on_menu_id_and_section_id", unique: true
    t.index ["menu_id"], name: "index_menu_sections_on_menu_id"
    t.index ["section_id", "menu_id"], name: "index_menu_sections_on_section_id_and_menu_id", unique: true
    t.index ["section_id"], name: "index_menu_sections_on_section_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "identifier", null: false
    t.string "label", null: false
    t.string "state", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "identifier", null: false
    t.string "label", null: false
    t.string "description", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  add_foreign_key "menu_sections", "menus"
  add_foreign_key "menu_sections", "sections"
end
