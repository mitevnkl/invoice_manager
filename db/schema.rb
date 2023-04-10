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

ActiveRecord::Schema[7.0].define(version: 2023_04_10_061936) do
  create_table "invoices", force: :cascade do |t|
    t.integer "number"
    t.integer "fiscal_year"
    t.integer "total_amount"
    t.string "service"
    t.string "customer"
    t.string "vehicle"
    t.date "date"
    t.date "due_date"
    t.text "extra_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "devizna", default: false
  end

end
