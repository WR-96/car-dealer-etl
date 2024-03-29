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

ActiveRecord::Schema.define(version: 2019_07_29_233018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parts_bills", force: :cascade do |t|
    t.string "client_name"
    t.string "date"
    t.string "sub_total"
    t.string "tax_percentage"
    t.string "tax_amount"
    t.string "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product"
    t.string "price"
    t.string "amount"
    t.string "rfc"
  end

  create_table "parts_clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "cellphone"
    t.string "email"
    t.string "rfc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts_employees", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "cellphone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts_provider_returns", force: :cascade do |t|
    t.string "provider_name"
    t.string "date"
    t.string "article"
    t.string "refound"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts_providers", force: :cascade do |t|
    t.string "tradename"
    t.string "phone"
    t.string "cellphone"
    t.string "email"
    t.string "car_maker"
    t.string "piece"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts_requisitions", force: :cascade do |t|
    t.string "employee_name"
    t.string "date"
    t.string "status"
    t.string "delivery_date"
    t.string "article"
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts_sale_returns", force: :cascade do |t|
    t.string "client_name"
    t.string "date"
    t.string "article"
    t.string "refound"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts_sales", force: :cascade do |t|
    t.string "client_name"
    t.string "employee_name"
    t.string "date"
    t.string "amount"
    t.string "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "price"
    t.string "product"
  end

  create_table "parts_spare_parts", force: :cascade do |t|
    t.string "description"
    t.string "car_model"
    t.string "car_maker"
    t.string "price"
    t.string "stock"
    t.string "reorder"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts_supplier_orders", force: :cascade do |t|
    t.string "employee_name"
    t.string "date"
    t.string "supplier_tradename"
    t.string "status"
    t.string "delivery_date"
    t.string "article"
    t.string "amount"
    t.string "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "price"
  end

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
    t.string "date"
    t.string "sub_total"
    t.string "total"
    t.string "tax_percentage"
    t.string "tax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "client_name"
    t.string "rfc"
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
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_payments", force: :cascade do |t|
    t.string "client_name"
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

  create_table "workshop_bills", force: :cascade do |t|
    t.string "client_name"
    t.string "date"
    t.string "sub_total"
    t.string "tax_percentage"
    t.string "tax_amount"
    t.string "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rfc"
    t.string "service"
  end

  create_table "workshop_bookings", force: :cascade do |t|
    t.string "mechanic_name"
    t.string "client_name"
    t.string "car"
    t.string "date"
    t.string "hour"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workshop_cars", force: :cascade do |t|
    t.string "client_name"
    t.string "maker"
    t.string "car"
    t.string "color"
    t.string "year"
    t.string "license_plate"
    t.string "serial_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "workshop_inspections", force: :cascade do |t|
    t.string "car"
    t.string "mechanic_name"
    t.string "date"
    t.string "mileage"
    t.string "fuel_level"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workshop_mechanics", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "cellphone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workshop_pieces", force: :cascade do |t|
    t.string "car"
    t.string "maker"
    t.string "description"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workshop_repairs", force: :cascade do |t|
    t.string "date"
    t.string "mechanic_name"
    t.string "car"
    t.string "description"
    t.string "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
