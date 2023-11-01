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

ActiveRecord::Schema.define(version: 20231030111926) do

  create_table "bills", force: :cascade do |t|
    t.date     "bill_date"
    t.integer  "customer_id", null: false
    t.integer  "product_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_bills_on_customer_id"
    t.index ["product_id"], name: "index_bills_on_product_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "customer_name"
    t.string   "customer_address"
    t.string   "customer_contact"
    t.date     "customer_dateofjoining"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "weight"
    t.integer  "amount"
    t.index ["bill_id"], name: "index_items_on_bill_id"
    t.index ["product_id"], name: "index_items_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_name"
    t.integer  "product_rate"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "unit"
    t.integer  "stock"
  end

  create_table "sellers", force: :cascade do |t|
    t.string   "seller_name"
    t.date     "seller_date"
    t.string   "seller_address"
    t.string   "seller_contact"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
