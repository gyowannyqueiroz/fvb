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

ActiveRecord::Schema.define(version: 2020_05_01_162033) do

  create_table "account_transactions", force: :cascade do |t|
    t.datetime "date"
    t.decimal "amount", precision: 20, scale: 2
    t.string "description"
    t.integer "account_id"
    t.decimal "balance", precision: 20, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_transactions_on_account_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.decimal "initial_amount", default: "0.0"
    t.integer "client_id"
    t.integer "currency_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_accounts_on_client_id"
    t.index ["currency_id"], name: "index_accounts_on_currency_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.boolean "parent", default: false
    t.integer "parent_client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_client_id"], name: "index_clients_on_parent_client_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
