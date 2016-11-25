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

ActiveRecord::Schema.define(version: 20161123230147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "yard_number",                 null: false
    t.string   "yard_name",                   null: false
    t.datetime "sale_datetime"
    t.string   "time_zone"
    t.integer  "item_number"
    t.integer  "lot_number",                  null: false
    t.string   "vehicle_type"
    t.integer  "year"
    t.string   "make"
    t.string   "model_group"
    t.string   "model_detail"
    t.string   "body_style"
    t.string   "color"
    t.string   "damage_description"
    t.string   "secondary_damage"
    t.string   "sale_title_state"
    t.string   "sale_title_type"
    t.boolean  "has_keys"
    t.string   "lot_cond_code"
    t.string   "vin"
    t.integer  "odometer"
    t.string   "odometer_brand"
    t.integer  "est_retail_value"
    t.integer  "repair_cost"
    t.string   "engine"
    t.string   "drive"
    t.string   "transmission"
    t.string   "fuel_type"
    t.integer  "cylinders"
    t.string   "runs_drives"
    t.string   "sale_status"
    t.integer  "high_bid"
    t.string   "special_note"
    t.string   "location_city"
    t.string   "location_state"
    t.string   "location_zip"
    t.string   "location_country"
    t.string   "currency_code"
    t.string   "image_thumbnail"
    t.string   "grid_row"
    t.boolean  "has_buyitnow"
    t.integer  "buyitnow_price"
    t.string   "lot_url"
    t.string   "state_of_ownership_doc_type"
    t.string   "ownership_doc_type"
    t.index ["lot_number"], name: "index_cars_on_lot_number", unique: true, using: :btree
  end

end
