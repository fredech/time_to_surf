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

ActiveRecord::Schema.define(version: 2019_03_04_182617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "preferred_spots", force: :cascade do |t|
    t.bigint "spot_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_preferred_spots_on_spot_id"
    t.index ["user_id"], name: "index_preferred_spots_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "level"
    t.string "address"
    t.bigint "user_id"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "access"
    t.bigint "surf_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.integer "condition"
    t.integer "facilities"
    t.index ["surf_session_id"], name: "index_reviews_on_surf_session_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spot_services", force: :cascade do |t|
    t.bigint "spot_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_spot_services_on_service_id"
    t.index ["spot_id"], name: "index_spot_services_on_spot_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.string "photo"
    t.string "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "seabed"
    t.string "best_tide"
    t.float "difficulty_level"
    t.integer "msw_id"
  end

  create_table "surf_sessions", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "spot_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_surf_sessions_on_spot_id"
    t.index ["user_id"], name: "index_surf_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pseudo"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "preferred_spots", "spots"
  add_foreign_key "preferred_spots", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "surf_sessions"
  add_foreign_key "spot_services", "services"
  add_foreign_key "spot_services", "spots"
  add_foreign_key "surf_sessions", "spots"
  add_foreign_key "surf_sessions", "users"
end
