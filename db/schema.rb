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

ActiveRecord::Schema[7.0].define(version: 2024_08_02_154603) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.datetime "time_slot", null: false
    t.string "day_of_week"
    t.string "timezone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id", "time_slot", "day_of_week"], name: "index_bookings_on_coach_id_and_time_slot_and_day_of_week", unique: true
    t.index ["coach_id"], name: "index_bookings_on_coach_id"
  end

  create_table "coach_availabilities", force: :cascade do |t|
    t.bigint "coach_id", null: false
    t.string "day_of_week"
    t.time "available_at"
    t.time "available_until"
    t.boolean "booked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_coach_availabilities_on_coach_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "name"
    t.string "timezone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "coaches"
  add_foreign_key "coach_availabilities", "coaches"
end
