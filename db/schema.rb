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

ActiveRecord::Schema.define(version: 20141223223007) do

  create_table "areas", force: true do |t|
    t.string   "name"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.integer  "zoom"
    t.string   "weather"
    t.text     "description"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
  end

  add_index "areas", ["state_id"], name: "index_areas_on_state_id"

  create_table "boulder_route_photos", force: true do |t|
    t.string   "title"
    t.integer  "boulder_route_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boulder_route_photos", ["boulder_route_id"], name: "index_boulder_route_photos_on_boulder_route_id"

  create_table "boulder_routes", force: true do |t|
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "zoom"
    t.text     "description"
    t.text     "directions"
    t.integer  "wall_id"
    t.string   "danger_rating"
    t.integer  "stars"
    t.integer  "pads"
    t.string   "hueco_grade"
    t.decimal  "length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boulder_routes", ["wall_id"], name: "index_boulder_routes_on_wall_id"

  create_table "crags", force: true do |t|
    t.integer  "territory_id"
    t.string   "name"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.integer  "zoom"
    t.text     "directions"
    t.text     "description"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "crags", ["territory_id"], name: "index_crags_on_territory_id"

  create_table "regions", force: true do |t|
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "zoom"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "sport_route_photos", force: true do |t|
    t.string   "title"
    t.integer  "sport_route_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sport_route_photos", ["sport_route_id"], name: "index_sport_route_photos_on_sport_route_id"

  create_table "sport_routes", force: true do |t|
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "zoom"
    t.text     "description"
    t.text     "directions"
    t.integer  "wall_id"
    t.string   "danger_rating"
    t.integer  "bolts"
    t.integer  "stars"
    t.integer  "pitches"
    t.string   "yds_grade"
    t.string   "anchor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "length"
  end

  add_index "sport_routes", ["wall_id"], name: "index_sport_routes_on_wall_id"

  create_table "states", force: true do |t|
    t.integer  "region_id"
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "zoom"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "states", ["region_id"], name: "index_states_on_region_id"

  create_table "territories", force: true do |t|
    t.integer  "area_id"
    t.string   "name"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.integer  "zoom"
    t.text     "directions"
    t.text     "description"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "territories", ["area_id"], name: "index_territories_on_area_id"

  create_table "traditional_route_photos", force: true do |t|
    t.string   "title"
    t.integer  "traditional_route_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "traditional_route_photos", ["traditional_route_id"], name: "index_traditional_route_photos_on_traditional_route_id"

  create_table "traditional_routes", force: true do |t|
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "zoom"
    t.text     "description"
    t.text     "directions"
    t.integer  "wall_id"
    t.string   "danger_rating"
    t.text     "gear_needed"
    t.integer  "stars"
    t.integer  "pitches"
    t.string   "yds_grade"
    t.decimal  "length"
    t.text     "anchor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "traditional_routes", ["wall_id"], name: "index_traditional_routes_on_wall_id"

  create_table "user_boulder_routes", force: true do |t|
    t.integer  "user_id"
    t.integer  "boulder_route_id"
    t.integer  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_boulder_routes", ["boulder_route_id"], name: "index_user_boulder_routes_on_boulder_route_id"
  add_index "user_boulder_routes", ["user_id"], name: "index_user_boulder_routes_on_user_id"

  create_table "user_sport_routes", force: true do |t|
    t.integer  "user_id"
    t.integer  "sport_route_id"
    t.integer  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_sport_routes", ["sport_route_id"], name: "index_user_sport_routes_on_sport_route_id"
  add_index "user_sport_routes", ["user_id"], name: "index_user_sport_routes_on_user_id"

  create_table "user_traditional_routes", force: true do |t|
    t.integer  "user_id"
    t.integer  "traditional_route_id"
    t.integer  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_traditional_routes", ["traditional_route_id"], name: "index_user_traditional_routes_on_traditional_route_id"
  add_index "user_traditional_routes", ["user_id"], name: "index_user_traditional_routes_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "salt"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wall_photos", force: true do |t|
    t.string   "title"
    t.integer  "wall_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wall_photos", ["wall_id"], name: "index_wall_photos_on_wall_id"

  create_table "walls", force: true do |t|
    t.integer  "crag_id"
    t.string   "name"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.integer  "zoom"
    t.text     "directions"
    t.text     "description"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "wall_type"
  end

  add_index "walls", ["crag_id"], name: "index_walls_on_crag_id"

end
