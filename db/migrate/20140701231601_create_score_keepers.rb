class CreateScoreKeepers < ActiveRecord::Migration
  def change
    create_table :score_keepers do |t|
      t.integer :pitcher_id, null: false
      t.integer :batter_id, null: false
      t.integer :scorer_id, null: false
      t.integer :batting_team_id, null: false
      t.integer :fielding_team_id, null: false
      t.integer :game_id, null: false
      t.integer :inning_number, null: false
      t.timestamps
    end
  end
end
