class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :home_lineup_id, null: false
      t.integer :away_lineup_id, null: false
      t.integer :home_score
      t.integer :away_score
    end
  end
end
