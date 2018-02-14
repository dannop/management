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

ActiveRecord::Schema.define(version: 20180214035004) do

  create_table "directories", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_directories_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.date "begin_date"
    t.date "end_date"
    t.integer "directory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["directory_id"], name: "index_goals_on_directory_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "client"
    t.text "description"
    t.decimal "value"
    t.date "start_date"
    t.date "end_date"
    t.integer "team_id"
    t.integer "current_sprint"
    t.integer "total_sprint"
    t.boolean "finalized"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_projects_on_team_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "project_id"
    t.integer "directory_id"
    t.integer "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["directory_id"], name: "index_tasks_on_directory_id"
    t.index ["goal_id"], name: "index_tasks_on_goal_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_members"
    t.integer "user_id"
    t.integer "limit_of_projects"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "teams_projects", force: :cascade do |t|
    t.integer "team_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_teams_projects_on_project_id"
    t.index ["team_id"], name: "index_teams_projects_on_team_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "admin"
    t.boolean "director"
    t.boolean "pmo"
    t.boolean "developer"
    t.boolean "advisor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "users_teams", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_users_teams_on_team_id"
    t.index ["user_id"], name: "index_users_teams_on_user_id"
  end

end
