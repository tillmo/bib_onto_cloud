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

ActiveRecord::Schema.define(:version => 20140306210838) do

  create_table "access", :force => true do |t|
    t.integer "fk_user",    :default => 0, :null => false
    t.integer "fk_entries", :default => 0, :null => false
  end

  add_index "access", ["id"], :name => "id", :unique => true
  add_index "access", ["id"], :name => "pk_int_2"

  create_table "disgroups_backup", :force => true do |t|
    t.string "name",        :limit => 40
    t.string "realname_de",               :default => "", :null => false
    t.string "realname_en",               :default => "", :null => false
  end

  add_index "disgroups_backup", ["name"], :name => "name", :unique => true

  create_table "disgrp_backup", :force => true do |t|
    t.integer "fk_entries", :limit => 3, :default => 0,  :null => false
    t.integer "fk_id",      :limit => 3, :default => 0,  :null => false
    t.string  "idtype",     :limit => 2, :default => "", :null => false
  end

  create_table "display_groups", :force => true do |t|
    t.integer "fk_entries", :limit => 3, :default => 0,  :null => false
    t.integer "fk_id",      :limit => 3, :default => 0,  :null => false
    t.string  "idtype",     :limit => 2, :default => "", :null => false
  end

  create_table "display_projects", :force => true do |t|
    t.integer "fk_entries", :limit => 3, :default => 0,  :null => false
    t.integer "fk_id",      :limit => 3, :default => 0,  :null => false
    t.string  "idtype",     :limit => 2, :default => "", :null => false
  end

  create_table "display_users", :force => true do |t|
    t.integer "fk_entries", :limit => 3, :default => 0,  :null => false
    t.integer "fk_id",      :limit => 3, :default => 0,  :null => false
    t.string  "idtype",     :limit => 2, :default => "", :null => false
  end

  create_table "entries", :force => true do |t|
    t.string  "bibkey",              :limit => 40,  :default => "", :null => false
    t.integer "fk_user",             :limit => 2,   :default => 0,  :null => false
    t.string  "fk_type",             :limit => 20,  :default => "", :null => false
    t.string  "author",                             :default => "", :null => false
    t.string  "author_sortkey",      :limit => 40,  :default => "", :null => false
    t.string  "title",                              :default => "", :null => false
    t.integer "year",                :limit => 2
    t.string  "editor",                             :default => "", :null => false
    t.string  "booktitle",                          :default => "", :null => false
    t.string  "publisher_name",      :limit => 80,  :default => "", :null => false
    t.string  "publisher_address",   :limit => 100, :default => "", :null => false
    t.string  "publisher_url",       :limit => 100, :default => "", :null => false
    t.string  "institution_name",    :limit => 80,  :default => "", :null => false
    t.string  "institution_address", :limit => 100, :default => "", :null => false
    t.string  "institution_url",     :limit => 100, :default => "", :null => false
    t.string  "school_name",         :limit => 80,  :default => "", :null => false
    t.string  "school_address",      :limit => 100, :default => "", :null => false
    t.string  "school_url",          :limit => 100, :default => "", :null => false
    t.string  "keywords",                           :default => "", :null => false
    t.string  "series",              :limit => 100, :default => "", :null => false
    t.string  "volume",                             :default => "", :null => false
    t.string  "chapter",                            :default => "", :null => false
    t.string  "pages",                              :default => "", :null => false
    t.string  "number",                             :default => "", :null => false
    t.string  "journal",                            :default => "", :null => false
    t.string  "crossref",            :limit => 40,  :default => "", :null => false
    t.string  "typpe",                              :default => "", :null => false
    t.string  "edition",                            :default => "", :null => false
    t.string  "howpublished",                       :default => "", :null => false
    t.string  "url",                                :default => "", :null => false
    t.string  "pdfurl",                             :default => "", :null => false
    t.string  "psurl",                              :default => "", :null => false
    t.text    "abstract",                                           :null => false
    t.string  "issn",                :limit => 30,  :default => "", :null => false
    t.string  "isbn",                :limit => 30,  :default => "", :null => false
    t.string  "note",                               :default => "", :null => false
    t.string  "fk_status",           :limit => 20,  :default => "", :null => false
    t.integer "timestamp"
  end

  create_table "groups", :force => true do |t|
    t.string "name",        :limit => 40
    t.string "realname_de",               :default => "", :null => false
    t.string "realname_en",               :default => "", :null => false
  end

  add_index "groups", ["name"], :name => "name", :unique => true

  create_table "institutions", :force => true do |t|
    t.string "name",    :limit => 80,  :default => "", :null => false
    t.string "address", :limit => 100, :default => "", :null => false
    t.string "url",     :limit => 100, :default => "", :null => false
  end

  create_table "keywords", :force => true do |t|
    t.string   "text"
    t.float    "relevance"
    t.integer  "entry_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "oai_resumptiontoken", :force => true do |t|
    t.string  "oai_verb",           :limit => 20, :default => "", :null => false
    t.string  "oai_from",           :limit => 20, :default => "", :null => false
    t.string  "oai_until",          :limit => 20, :default => "", :null => false
    t.string  "oai_metadataPrefix", :limit => 20, :default => "", :null => false
    t.string  "oai_set",            :limit => 30, :default => "", :null => false
    t.integer "oai_lastIndex",                    :default => 0,  :null => false
    t.integer "oai_timestamp",                    :default => 0,  :null => false
  end

  create_table "projects", :force => true do |t|
    t.integer "fk_groups",   :limit => 3,  :default => 0,  :null => false
    t.string  "name",        :limit => 40, :default => "", :null => false
    t.string  "realname_de",               :default => "", :null => false
    t.string  "realname_en",               :default => "", :null => false
  end

  add_index "projects", ["id"], :name => "id", :unique => true
  add_index "projects", ["id"], :name => "pk_int_2"

  create_table "publishers", :force => true do |t|
    t.string "name",    :limit => 80,  :default => "", :null => false
    t.string "address", :limit => 100, :default => "", :null => false
    t.string "url",     :limit => 100, :default => "", :null => false
  end

  create_table "schools", :force => true do |t|
    t.string "name",    :limit => 80,  :default => "", :null => false
    t.string "address", :limit => 100, :default => "", :null => false
    t.string "url",     :limit => 100, :default => "", :null => false
  end

  create_table "searchindex", :id => false, :force => true do |t|
    t.integer "fk_entries",               :default => 0,  :null => false
    t.string  "keyword",    :limit => 50, :default => "", :null => false
  end

  add_index "searchindex", ["keyword"], :name => "keyword"

  create_table "series", :force => true do |t|
    t.string "series", :limit => 80, :default => "", :null => false
  end

  create_table "status", :primary_key => "status", :force => true do |t|
    t.integer "sortierreihenfolge", :limit => 1, :default => 0, :null => false
  end

  create_table "tag_entries", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "entry_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "text"
    t.integer  "count"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "onto"
  end

  create_table "types", :primary_key => "pk_bibname", :force => true do |t|
    t.string "descr_de",         :default => "", :null => false
    t.string "descr_en",         :default => "", :null => false
    t.string "include_filename", :default => "", :null => false
    t.string "alternatives",     :default => "", :null => false
  end

  create_table "users", :force => true do |t|
    t.integer "fk_groups", :limit => 3,  :default => 0,  :null => false
    t.string  "username",  :limit => 20, :default => "", :null => false
    t.string  "realname",                :default => "", :null => false
    t.string  "passwort",  :limit => 20, :default => "", :null => false
    t.integer "login",     :limit => 1,  :default => 0,  :null => false
  end

  add_index "users", ["username"], :name => "username", :unique => true

end
