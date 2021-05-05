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

ActiveRecord::Schema.define(version: 2021_05_05_045854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mappings", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_mappings_on_member_id"
    t.index ["team_id"], name: "index_mappings_on_team_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "secret_identity"
    t.string "powers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "home_town"
    t.integer "formed"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "mappings", "members"
  add_foreign_key "mappings", "teams"
end
