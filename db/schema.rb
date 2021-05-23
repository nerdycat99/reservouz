# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_17_083404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emails", force: :cascade do |t|
    t.text "recipient_email"
    t.text "recipient_phone"
    t.text "start_time"
    t.text "end_time"
    t.text "venue_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "name"
    t.text "object_id"
    t.text "reservation_type"
  end

  create_table "policies", force: :cascade do |t|
    t.string "venue_id"
    t.string "monday", default: [], array: true
    t.string "tuesday", default: [], array: true
    t.string "wednesday", default: [], array: true
    t.string "thursday", default: [], array: true
    t.string "friday", default: [], array: true
    t.string "saturday", default: [], array: true
    t.string "sunday", default: [], array: true
    t.integer "concurrent_bookings"
    t.integer "duration_allowed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["venue_id"], name: "index_policies_on_venue_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "venue_id"
    t.string "first_name"
    t.string "last_name"
    t.string "state"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.text "name"
    t.text "email_address"
    t.text "external_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "zone"
    t.text "address"
    t.float "latitude"
    t.float "longitude"
  end

end
