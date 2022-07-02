# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_02_173721) do

  create_table "boxes", force: :cascade do |t|
    t.string "name"
    t.string "language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_boxes_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.integer "box_id", null: false
    t.integer "color"
    t.integer "level"
    t.string "from"
    t.string "to"
    t.string "audio"
    t.string "language_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "next_test", default: "2022-04-15 08:58:29"
    t.text "definition"
    t.index ["box_id"], name: "index_cards_on_box_id"
  end

  create_table "masteries", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "from"
    t.string "to"
    t.string "audio"
    t.integer "repetitions"
    t.integer "interval"
    t.float "ease"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "next_test", default: "2022-04-15 08:58:29"
    t.text "definition"
    t.integer "color"
    t.index ["user_id"], name: "index_masteries_on_user_id"
  end

  create_table "slots", force: :cascade do |t|
    t.integer "order"
    t.integer "interval"
    t.string "quiztype"
    t.integer "box_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["box_id"], name: "index_slots_on_box_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "boxes", "users"
  add_foreign_key "cards", "boxes"
  add_foreign_key "masteries", "users"
  add_foreign_key "slots", "boxes"
end
