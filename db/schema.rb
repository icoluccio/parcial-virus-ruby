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

ActiveRecord::Schema.define(version: 2021_11_21_153531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "computadoras", force: :cascade do |t|
    t.float "memoria"
    t.float "disco"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "programa_id", null: false
    t.bigint "computadora_id", null: false
    t.text "hecho"
    t.integer "turno"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["computadora_id"], name: "index_logs_on_computadora_id"
    t.index ["programa_id"], name: "index_logs_on_programa_id"
  end

  create_table "programas", force: :cascade do |t|
    t.string "nombre"
    t.string "type", default: "Programa"
    t.boolean "ejecutando", default: false
    t.integer "potencia", default: 0
    t.integer "memoria", default: 0
    t.integer "disco", default: 0
    t.integer "ejecuciones", default: 0
    t.bigint "computadora_id"
    t.bigint "programa_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["computadora_id"], name: "index_programas_on_computadora_id"
    t.index ["programa_id"], name: "index_programas_on_programa_id"
  end

  add_foreign_key "logs", "computadoras"
  add_foreign_key "logs", "programas"
  add_foreign_key "programas", "computadoras"
  add_foreign_key "programas", "programas"
end
