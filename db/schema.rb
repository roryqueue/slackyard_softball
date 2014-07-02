# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140702002707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.integer "home_lineup_id", null: false
    t.integer "away_lineup_id", null: false
  end

  create_table "lineups", force: true do |t|
    t.integer "team_id",           null: false
    t.integer "pitcher_id",        null: false
    t.integer "catcher_id",        null: false
    t.integer "first_baseman_id",  null: false
    t.integer "second_baseman_id", null: false
    t.integer "third_baseman_id",  null: false
    t.integer "shortstop_id",      null: false
    t.integer "left_fielder_id",   null: false
    t.integer "center_fielder_id", null: false
    t.integer "right_fielder_id",  null: false
    t.integer "first_up_id",       null: false
    t.integer "second_up_id",      null: false
    t.integer "third_up_id",       null: false
    t.integer "fourth_up_id",      null: false
    t.integer "fifth_up_id",       null: false
    t.integer "sixth_up_id",       null: false
    t.integer "seventh_up_id",     null: false
    t.integer "eight_up_id",       null: false
    t.integer "ninth_up_id",       null: false
    t.string  "nickname"
  end

  create_table "pitches", force: true do |t|
    t.integer  "game_id",                          null: false
    t.integer  "inning_number",                    null: false
    t.integer  "pitcher_id",                       null: false
    t.integer  "hitter_id",                        null: false
    t.integer  "fielder_id",                       null: false
    t.integer  "hitting_team_id",                  null: false
    t.integer  "fielding_team_id",                 null: false
    t.boolean  "strike_zone",                      null: false
    t.boolean  "swing",                            null: false
    t.boolean  "contact",          default: false, null: false
    t.string   "contact_result",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.integer "team_id"
    t.string  "first_name"
    t.string  "last_name",           null: false
    t.integer "batting_contact",     null: false
    t.integer "batting_power",       null: false
    t.integer "pitching_craftiness", null: false
    t.integer "pitching_accuracy",   null: false
    t.integer "fielding",            null: false
    t.integer "speed",               null: false
  end

  create_table "runs", force: true do |t|
    t.integer  "pitcher_id",       null: false
    t.integer  "hitter_id",        null: false
    t.integer  "scorer_id",        null: false
    t.integer  "hitting_team_id",  null: false
    t.integer  "fielding_team_id", null: false
    t.integer  "game_id",          null: false
    t.integer  "inning_number",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string "name", null: false
  end

end
