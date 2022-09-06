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

ActiveRecord::Schema.define(version: 2022_09_06_193927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "status", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "weight"
    t.string "bodycomp"
    t.float "lean_mass"
    t.string "goal"
    t.string "activity_level"
    t.string "training_load"
    t.string "fc_pref"
    t.float "multiplier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phases", force: :cascade do |t|
    t.float "protein_grams"
    t.float "protein_cals"
    t.float "protein_percent"
    t.float "carb_grams"
    t.float "carb_cals"
    t.float "carb_percent"
    t.float "fat_grams"
    t.float "fat_cals"
    t.float "fat_percent"
    t.string "name"
    t.float "kcal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "person_id"
    t.index ["person_id"], name: "index_phases_on_person_id"
  end

  add_foreign_key "phases", "people"
end
