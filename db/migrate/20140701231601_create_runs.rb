class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer :pitcher_id, null: false
      t.integer :hitter_id, null: false
      t.integer :scorer_id, null: false
      t.integer :hitting_team_id, null: false
      t.integer :fielding_team_id, null: false
      t.integer :game_id, null: false
      t.integer :inning_number, null: false
      t.timestamps
    end
  end
end
