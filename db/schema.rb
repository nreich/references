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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120719211058) do

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authors", ["name"], :name => "index_authors_on_name", :unique => true

  create_table "citation_author_relationships", :force => true do |t|
    t.integer  "citation_id"
    t.integer  "author_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "citation_author_relationships", ["author_id"], :name => "index_reference_author_relationships_on_author_id"
  add_index "citation_author_relationships", ["citation_id"], :name => "index_reference_author_relationships_on_reference_id"

  create_table "citations", :force => true do |t|
    t.text     "title"
    t.text     "abstract"
    t.text     "pubmed_url"
    t.text     "file_location"
    t.string   "citation_type"
    t.string   "journal"
    t.string   "issue"
    t.string   "volume"
    t.string   "pages"
    t.text     "conference"
    t.string   "patent_assignee"
    t.string   "patent_number"
    t.string   "publisher"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "publish_year"
    t.text     "author_list"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["first_name", "last_name"], :name => "index_users_on_first_name_and_last_name", :unique => true

end
