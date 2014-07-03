class CreateStatKeepers < ActiveRecord::Migration
  def change
    create_table :stat_keepers do |t|
      t.integer :game_id, null: false
      t.integer :inning_number, null: false
      t.integer :pitcher_id, null: false
      t.integer :batter_id, null: false
      t.integer :fielder_id
      t.integer :batting_team_id, null: false
      t.integer :fielding_team_id, null: false
      t.boolean :strike_zone, null: false
      t.boolean :swing, null: false
      t.boolean :contact, default: false
      t.string :contact_result
      t.timestamps
    end
  end
end
