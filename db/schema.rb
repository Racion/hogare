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

ActiveRecord::Schema.define(version: 2021_03_07_193729) do

  create_table "addresses", force: :cascade do |t|
    t.string "address_description", default: "", null: false
    t.string "address", default: "", null: false
    t.string "address_complement", default: ""
    t.integer "phone", default: 0, null: false
    t.integer "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_addresses_on_client_id"
  end

  create_table "admins", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "contract_start", null: false
    t.date "contract_end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_status", default: "Creada", null: false
    t.integer "order_total_value", default: 0
    t.integer "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "service_description", default: "", null: false
    t.date "service_date", null: false
    t.integer "price", default: 60000, null: false
    t.string "service_status", default: "Creado", null: false
    t.integer "order_id", null: false
    t.integer "employee_id"
    t.integer "client_id", null: false
    t.integer "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_services_on_address_id"
    t.index ["client_id"], name: "index_services_on_client_id"
    t.index ["employee_id"], name: "index_services_on_employee_id"
    t.index ["order_id"], name: "index_services_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.integer "dni", null: false
    t.integer "phone", null: false
    t.string "address", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "clients"
  add_foreign_key "admins", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "employees", "users"
  add_foreign_key "orders", "clients"
  add_foreign_key "services", "addresses"
  add_foreign_key "services", "clients"
  add_foreign_key "services", "employees"
  add_foreign_key "services", "orders"
end
