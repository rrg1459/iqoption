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

ActiveRecord::Schema.define(version: 2021_01_15_000001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "canales", force: :cascade do |t|
    t.string "nombre", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "numeros", force: :cascade do |t|
    t.integer "inversion", null: false
    t.integer "fondo", null: false
    t.integer "porcentaje", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "canal_id"
  end

  create_table "opciones", force: :cascade do |t|
    t.integer "juliano", null: false
    t.string "resultado", null: false
    t.integer "porcentaje", null: false
    t.integer "inversion", null: false
    t.string "tipo", null: false
    t.integer "par_id", null: false
    t.integer "reloj_id", null: false
    t.integer "canal_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "pares", force: :cascade do |t|
    t.string "nombre", null: false
    t.string "imagen"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "relojes", force: :cascade do |t|
    t.integer "minuto", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  add_foreign_key "numeros", "canales", on_delete: :cascade
  add_foreign_key "opciones", "canales", on_delete: :cascade
  add_foreign_key "opciones", "pares", on_delete: :cascade
  add_foreign_key "opciones", "relojes", on_delete: :cascade
end
