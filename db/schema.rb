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

ActiveRecord::Schema.define(version: 2019_07_03_233809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sales_addresses", force: :cascade do |t|
    t.string "client_name"
    t.string "address_line"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_bills", force: :cascade do |t|
    t.string "deal_number"
    t.string "date"
    t.string "sub_total"
    t.string "total"
    t.string "tax_percentage"
    t.string "tax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_cars", force: :cascade do |t|
    t.string "model"
    t.string "category"
    t.string "maker"
    t.string "color"
    t.string "year"
    t.string "price"
    t.string "miles"
    t.string "serial_number"
    t.string "purchase_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "cellphone"
    t.string "email"
    t.string "rfc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_deals", force: :cascade do |t|
    t.string "client_name"
    t.string "agent_name"
    t.string "car"
    t.string "price"
    t.string "date"
    t.string "monthly_payment"
    t.string "payment_due_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_employees", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.bigint "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_payments", force: :cascade do |t|
    t.string "client_name"
    t.string "deal_number"
    t.string "status"
    t.string "due_date"
    t.string "payment_date"
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_test_drives", force: :cascade do |t|
    t.string "client_name"
    t.string "agent_name"
    t.string "car"
    t.string "date"
    t.string "hour"
    t.string "license_number"
    t.string "inital_miles"
    t.string "final_miles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workshop_clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "cellphone"
    t.string "email"
    t.string "rfc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
