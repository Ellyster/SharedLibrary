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

ActiveRecord::Schema.define(version: 20140821014751) do

  create_table "authors", force: true do |t|
    t.string   "name"
    t.string   "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors_books", id: false, force: true do |t|
    t.integer "author_id", null: false
    t.integer "book_id",   null: false
  end

  add_index "authors_books", ["author_id", "book_id"], name: "index_authors_books_on_author_id_and_book_id", unique: true
  add_index "authors_books", ["book_id", "author_id"], name: "index_authors_books_on_book_id_and_author_id", unique: true

  create_table "books", force: true do |t|
    t.string   "title"
    t.text     "blurb"
    t.integer  "publisher_id"
    t.integer  "language_id"
    t.text     "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "active_copies_count", default: 0,   null: false
    t.integer  "reviews_count",       default: 0,   null: false
    t.float    "score_avg",           default: 0.0, null: false
  end

  add_index "books", ["language_id"], name: "index_books_on_language_id"
  add_index "books", ["publisher_id"], name: "index_books_on_publisher_id"

  create_table "books_topics", id: false, force: true do |t|
    t.integer "book_id",  null: false
    t.integer "topic_id", null: false
  end

  add_index "books_topics", ["book_id", "topic_id"], name: "index_books_topics_on_book_id_and_topic_id", unique: true
  add_index "books_topics", ["topic_id", "book_id"], name: "index_books_topics_on_topic_id_and_book_id", unique: true

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "books_count", default: 0, null: false
  end

  create_table "copies", force: true do |t|
    t.integer  "edition_id"
    t.string   "location_id"
    t.string   "owner_id"
    t.boolean  "lost",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "copies", ["edition_id"], name: "index_copies_on_edition_id"
  add_index "copies", ["location_id"], name: "index_copies_on_location_id"
  add_index "copies", ["owner_id"], name: "index_copies_on_owner_id"

  create_table "editions", force: true do |t|
    t.integer  "book_id"
    t.string   "isbn13"
    t.integer  "edition"
    t.string   "cover"
    t.string   "amazon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "active_copies_count", default: 0, null: false
  end

  add_index "editions", ["book_id"], name: "index_editions_on_book_id"

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "room"
    t.string   "bookshelf"
    t.string   "shelf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owners", force: true do |t|
    t.string   "name"
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "score"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["book_id"], name: "index_reviews_on_book_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "rindokus", force: true do |t|
    t.integer  "year"
    t.string   "semester"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "books_count", default: 0, null: false
  end

  add_index "topics", ["category_id"], name: "index_topics_on_category_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "librarian",          default: false
    t.boolean  "admin",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
