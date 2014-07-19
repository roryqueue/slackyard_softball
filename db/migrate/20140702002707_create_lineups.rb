class CreateLineups < ActiveRecord::Migration
  def change
    create_table :lineups do |t|
      t.integer :team_id, null: false
      t.integer :pitcher_id, null: false
      t.integer :catcher_id, null: false
      t.integer :first_baseman_id, null: false
      t.integer :second_baseman_id, null: false
      t.integer :third_baseman_id, null: false
      t.integer :shortstop_id, null: false
      t.integer :left_fielder_id, null: false
      t.integer :center_fielder_id, null: false
      t.integer :right_fielder_id, null: false
      t.integer :first_up_id, null: false
      t.integer :second_up_id, null: false
      t.integer :third_up_id, null: false
      t.integer :fourth_up_id, null: false
      t.integer :fifth_up_id, null: false
      t.integer :sixth_up_id, null: false
      t.integer :seventh_up_id, null: false
      t.integer :eighth_up_id, null: false
      t.integer :ninth_up_id, null: false
      t.string :nickname

      t.timestamps
    end
  end
end
