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

ActiveRecord::Schema.define(version: 20131115145139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: true do |t|
    t.string   "title"
    t.datetime "release_date"
    t.string   "identification"
    t.integer  "band_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["band_id"], name: "index_albums_on_band_id", using: :btree

  create_table "artists", force: true do |t|
    t.string   "name"
    t.text     "biography"
    t.datetime "birthday"
    t.string   "role"
    t.datetime "join_date"
    t.string   "identification"
    t.integer  "band_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artists", ["band_id"], name: "index_artists_on_band_id", using: :btree

  create_table "bands", force: true do |t|
    t.string   "name"
    t.string   "identification"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bands", ["genre_id"], name: "index_bands_on_genre_id", using: :btree

  create_table "genres", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "identification"
    t.integer  "related_genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.text     "venue"
    t.text     "street_address"
    t.string   "city"
    t.string   "country"
    t.string   "continent"
    t.string   "identification"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", force: true do |t|
    t.string   "title"
    t.datetime "date"
    t.string   "identification"
    t.integer  "location_id"
    t.integer  "band_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shows", ["band_id"], name: "index_shows_on_band_id", using: :btree
  add_index "shows", ["location_id"], name: "index_shows_on_location_id", using: :btree

  create_table "songs", force: true do |t|
    t.string   "title"
    t.integer  "ranking"
    t.string   "identification"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id", using: :btree

end
