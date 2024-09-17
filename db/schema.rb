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

ActiveRecord::Schema[7.2].define(version: 2024_09_17_151842) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "redirections", force: :cascade do |t|
    t.string "url_address", null: false
    t.string "alias", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alias"], name: "index_redirections_on_alias", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.string "ip_address", null: false
    t.bigint "redirection_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_agent", null: false
    t.string "browser", null: false
    t.string "operating_system", null: false
    t.index ["redirection_id"], name: "index_visits_on_redirection_id"
  end

  add_foreign_key "visits", "redirections"
end
