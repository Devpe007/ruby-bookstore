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

ActiveRecord::Schema[7.1].define(version: 2024_04_09_121044) do
  create_table "books", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.date "published_at", null: false
    t.text "text", null: false
    t.decimal "value", precision: 10, scale: 2, null: false
    t.integer "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_books_on_person_id"
  end

  create_table "books_categories", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "category_id", null: false
    t.index ["book_id", "category_id"], name: "index_books_categories_on_book_id_and_category_id"
    t.index ["category_id", "book_id"], name: "index_books_categories_on_category_id_and_book_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "email", limit: 100
    t.string "password_digest", limit: 100
    t.date "born_at"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_people_on_email", unique: true
  end

  add_foreign_key "books", "people"
end
