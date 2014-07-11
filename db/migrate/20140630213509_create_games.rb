class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :home_team_lineup_id, null: false
      t.integer :away_team_lineup_id, null: false
      t.integer :home_score, default: 0
      t.integer :away_score, default: 0

      t.timestamps
    end
  end
end
