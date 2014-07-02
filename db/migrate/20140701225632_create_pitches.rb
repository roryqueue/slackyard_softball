class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.integer :game_id, null: false
      t.integer :inning_number, null: false
      t.integer :pitcher_id, null: false
      t.integer :hitter_id, null: false
      t.integer :fielder_id, null: false
      t.integer :hitting_team_id, null: false
      t.integer :fielding_team_id, null: false
      t.boolean :strike_zone, null: false
      t.boolean :swing, null: false
      t.boolean :contact, null: false, default: false
      t.string :contact_result, null: false
      t.timestamps
    end
  end
end
