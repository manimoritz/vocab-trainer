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

ActiveRecord::Schema[8.0].define(version: 2025_02_02_132526) do
  create_table "forms", force: :cascade do |t|
    t.string "text", null: false
    t.string "person", null: false
    t.string "number", null: false
    t.string "tense", null: false
    t.string "voice", null: false
    t.string "mood", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "verb_id", null: false
    t.index ["verb_id"], name: "index_forms_on_verb_id"
  end

  create_table "verbs", force: :cascade do |t|
    t.string "present_infinitive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "present_active"
    t.string "perfect_active"
    t.string "supine"
  end

  add_foreign_key "forms", "verbs"
end
