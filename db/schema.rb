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

ActiveRecord::Schema.define(version: 2020_09_22_000638) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "subcategory_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subcategory_id"], name: "index_skills_on_subcategory_id"
  end

  create_table "skills_tickets", id: false, force: :cascade do |t|
    t.integer "ticket_id", null: false
    t.integer "skill_id", null: false
    t.index ["skill_id"], name: "index_skills_tickets_on_skill_id"
    t.index ["ticket_id"], name: "index_skills_tickets_on_ticket_id"
  end

  create_table "skills_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "skill_id", null: false
    t.index ["skill_id"], name: "index_skills_users_on_skill_id"
    t.index ["user_id"], name: "index_skills_users_on_user_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id", null: false
    t.integer "subcategory_id", null: false
    t.string "status"
    t.boolean "accepted"
    t.integer "accepted_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subcategory_id"], name: "index_tickets_on_subcategory_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "tickets_users", id: false, force: :cascade do |t|
    t.integer "ticket_id", null: false
    t.integer "user_id", null: false
    t.index ["ticket_id"], name: "index_tickets_users_on_ticket_id"
    t.index ["user_id"], name: "index_tickets_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "skills", "subcategories"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "tickets", "subcategories"
  add_foreign_key "tickets", "users"
end
