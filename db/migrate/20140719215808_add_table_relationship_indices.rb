class AddTableRelationshipIndices < ActiveRecord::Migration
  def change
    add_index :games, :home_team_lineup_id
    add_index :games, :away_team_lineup_id
    add_index :leagues, :commissioner_id
    add_index :leagues, :champion_id
    add_index :lineups, :team_id
    add_index :lineups, :pitcher_id
    add_index :lineups, :catcher_id
    add_index :lineups, :first_baseman_id
    add_index :lineups, :second_baseman_id
    add_index :lineups, :third_baseman_id
    add_index :lineups, :shortstop_id
    add_index :lineups, :left_fielder_id
    add_index :lineups, :center_fielder_id
    add_index :lineups, :right_fielder_id
    add_index :lineups, :first_up_id
    add_index :lineups, :second_up_id
    add_index :lineups, :third_up_id
    add_index :lineups, :fourth_up_id
    add_index :lineups, :fifth_up_id
    add_index :lineups, :sixth_up_id
    add_index :lineups, :seventh_up_id
    add_index :lineups, :eighth_up_id
    add_index :lineups, :ninth_up_id
    add_index :out_keepers, :pitcher_id
    add_index :out_keepers, :batter_id
    add_index :out_keepers, :game_id
    add_index :players, :team_id
    add_index :score_keepers, :pitcher_id
    add_index :score_keepers, :batter_id
    add_index :score_keepers, :scorer_id
    add_index :score_keepers, :batting_team_id
    add_index :score_keepers, :fielding_team_id
    add_index :score_keepers, :game_id
    add_index :stat_keepers, :game_id
    add_index :stat_keepers, :pitcher_id
    add_index :stat_keepers, :batter_id
    add_index :stat_keepers, :fielder_id
    add_index :stat_keepers, :batting_team_id
    add_index :stat_keepers, :fielding_team_id
    add_index :teams, :league_id
    add_index :teams, :user_id
  end
end
