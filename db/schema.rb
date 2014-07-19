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

ActiveRecord::Schema.define(version: 20140719221217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.integer  "home_team_lineup_id",             null: false
    t.integer  "away_team_lineup_id",             null: false
    t.integer  "home_score",          default: 0
    t.integer  "away_score",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["away_team_lineup_id"], name: "index_games_on_away_team_lineup_id", using: :btree
  add_index "games", ["created_at"], name: "index_games_on_created_at", using: :btree
  add_index "games", ["home_team_lineup_id"], name: "index_games_on_home_team_lineup_id", using: :btree
  add_index "games", ["updated_at"], name: "index_games_on_updated_at", using: :btree

  create_table "installs", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "installs", ["email"], name: "index_installs_on_email", unique: true, using: :btree
  add_index "installs", ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true, using: :btree

  create_table "leagues", force: true do |t|
    t.string   "name",            null: false
    t.integer  "commissioner_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "champion_id"
  end

  add_index "leagues", ["champion_id"], name: "index_leagues_on_champion_id", using: :btree
  add_index "leagues", ["commissioner_id"], name: "index_leagues_on_commissioner_id", using: :btree

  create_table "lineups", force: true do |t|
    t.integer "team_id",                           null: false
    t.integer "pitcher_id",                        null: false
    t.integer "catcher_id",                        null: false
    t.integer "first_baseman_id",                  null: false
    t.integer "second_baseman_id",                 null: false
    t.integer "third_baseman_id",                  null: false
    t.integer "shortstop_id",                      null: false
    t.integer "left_fielder_id",                   null: false
    t.integer "center_fielder_id",                 null: false
    t.integer "right_fielder_id",                  null: false
    t.integer "first_up_id",                       null: false
    t.integer "second_up_id",                      null: false
    t.integer "third_up_id",                       null: false
    t.integer "fourth_up_id",                      null: false
    t.integer "fifth_up_id",                       null: false
    t.integer "sixth_up_id",                       null: false
    t.integer "seventh_up_id",                     null: false
    t.integer "eighth_up_id",                      null: false
    t.integer "ninth_up_id",                       null: false
    t.string  "nickname"
    t.boolean "active",            default: false
  end

  add_index "lineups", ["catcher_id"], name: "index_lineups_on_catcher_id", using: :btree
  add_index "lineups", ["center_fielder_id"], name: "index_lineups_on_center_fielder_id", using: :btree
  add_index "lineups", ["eighth_up_id"], name: "index_lineups_on_eighth_up_id", using: :btree
  add_index "lineups", ["fifth_up_id"], name: "index_lineups_on_fifth_up_id", using: :btree
  add_index "lineups", ["first_baseman_id"], name: "index_lineups_on_first_baseman_id", using: :btree
  add_index "lineups", ["first_up_id"], name: "index_lineups_on_first_up_id", using: :btree
  add_index "lineups", ["fourth_up_id"], name: "index_lineups_on_fourth_up_id", using: :btree
  add_index "lineups", ["left_fielder_id"], name: "index_lineups_on_left_fielder_id", using: :btree
  add_index "lineups", ["ninth_up_id"], name: "index_lineups_on_ninth_up_id", using: :btree
  add_index "lineups", ["pitcher_id"], name: "index_lineups_on_pitcher_id", using: :btree
  add_index "lineups", ["right_fielder_id"], name: "index_lineups_on_right_fielder_id", using: :btree
  add_index "lineups", ["second_baseman_id"], name: "index_lineups_on_second_baseman_id", using: :btree
  add_index "lineups", ["second_up_id"], name: "index_lineups_on_second_up_id", using: :btree
  add_index "lineups", ["seventh_up_id"], name: "index_lineups_on_seventh_up_id", using: :btree
  add_index "lineups", ["shortstop_id"], name: "index_lineups_on_shortstop_id", using: :btree
  add_index "lineups", ["sixth_up_id"], name: "index_lineups_on_sixth_up_id", using: :btree
  add_index "lineups", ["team_id"], name: "index_lineups_on_team_id", using: :btree
  add_index "lineups", ["third_baseman_id"], name: "index_lineups_on_third_baseman_id", using: :btree
  add_index "lineups", ["third_up_id"], name: "index_lineups_on_third_up_id", using: :btree

  create_table "out_keepers", force: true do |t|
    t.integer "pitcher_id", null: false
    t.integer "batter_id",  null: false
    t.integer "game_id",    null: false
    t.string  "detail"
  end

  add_index "out_keepers", ["batter_id"], name: "index_out_keepers_on_batter_id", using: :btree
  add_index "out_keepers", ["game_id"], name: "index_out_keepers_on_game_id", using: :btree
  add_index "out_keepers", ["pitcher_id"], name: "index_out_keepers_on_pitcher_id", using: :btree

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
    t.string  "picture"
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "score_keepers", force: true do |t|
    t.integer  "pitcher_id",       null: false
    t.integer  "batter_id",        null: false
    t.integer  "scorer_id",        null: false
    t.integer  "batting_team_id",  null: false
    t.integer  "fielding_team_id", null: false
    t.integer  "game_id",          null: false
    t.integer  "inning_number",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "score_keepers", ["batter_id"], name: "index_score_keepers_on_batter_id", using: :btree
  add_index "score_keepers", ["batting_team_id"], name: "index_score_keepers_on_batting_team_id", using: :btree
  add_index "score_keepers", ["created_at"], name: "index_score_keepers_on_created_at", using: :btree
  add_index "score_keepers", ["fielding_team_id"], name: "index_score_keepers_on_fielding_team_id", using: :btree
  add_index "score_keepers", ["game_id"], name: "index_score_keepers_on_game_id", using: :btree
  add_index "score_keepers", ["pitcher_id"], name: "index_score_keepers_on_pitcher_id", using: :btree
  add_index "score_keepers", ["scorer_id"], name: "index_score_keepers_on_scorer_id", using: :btree
  add_index "score_keepers", ["updated_at"], name: "index_score_keepers_on_updated_at", using: :btree

  create_table "stat_keepers", force: true do |t|
    t.integer  "game_id",                          null: false
    t.integer  "inning_number",                    null: false
    t.integer  "pitcher_id",                       null: false
    t.integer  "batter_id",                        null: false
    t.integer  "fielder_id"
    t.integer  "batting_team_id",                  null: false
    t.integer  "fielding_team_id",                 null: false
    t.boolean  "strike_zone",                      null: false
    t.boolean  "swing",                            null: false
    t.boolean  "contact",          default: false
    t.string   "contact_result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stat_keepers", ["batter_id"], name: "index_stat_keepers_on_batter_id", using: :btree
  add_index "stat_keepers", ["batting_team_id"], name: "index_stat_keepers_on_batting_team_id", using: :btree
  add_index "stat_keepers", ["created_at"], name: "index_stat_keepers_on_created_at", using: :btree
  add_index "stat_keepers", ["fielder_id"], name: "index_stat_keepers_on_fielder_id", using: :btree
  add_index "stat_keepers", ["fielding_team_id"], name: "index_stat_keepers_on_fielding_team_id", using: :btree
  add_index "stat_keepers", ["game_id"], name: "index_stat_keepers_on_game_id", using: :btree
  add_index "stat_keepers", ["pitcher_id"], name: "index_stat_keepers_on_pitcher_id", using: :btree
  add_index "stat_keepers", ["updated_at"], name: "index_stat_keepers_on_updated_at", using: :btree

  create_table "teams", force: true do |t|
    t.string  "name",      null: false
    t.integer "league_id", null: false
    t.integer "user_id",   null: false
  end

  add_index "teams", ["league_id"], name: "index_teams_on_league_id", using: :btree
  add_index "teams", ["user_id"], name: "index_teams_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "user_name",                           null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_photo"
    t.integer  "titles",                 default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
