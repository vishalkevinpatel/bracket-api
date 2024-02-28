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

ActiveRecord::Schema[7.0].define(version: 2024_02_28_013528) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brackets", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "total_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "round1"
    t.integer "round2"
    t.integer "round3"
    t.integer "round4"
    t.integer "round5"
    t.integer "round6"
    t.integer "round0"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.bigint "winner_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "round"
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
    t.index ["winner_team_id"], name: "index_games_on_winner_team_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "bracket_id"
    t.integer "game_id"
    t.bigint "pick_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "winner_team_id"
    t.index ["pick_team_id"], name: "index_matches_on_pick_team_id"
    t.index ["winner_team_id"], name: "index_matches_on_winner_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "seed"
    t.string "region"
    t.integer "superseed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "teams", column: "away_team_id"
  add_foreign_key "games", "teams", column: "home_team_id"
  add_foreign_key "games", "teams", column: "winner_team_id"
  add_foreign_key "matches", "teams", column: "pick_team_id"
  add_foreign_key "matches", "teams", column: "winner_team_id"
end
