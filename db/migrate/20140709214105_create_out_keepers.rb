class CreateOutKeepers < ActiveRecord::Migration
  def change
    create_table :out_keepers do |t|
      t.integer :pitcher_id, null: false
      t.integer :batter_id, null: false
      t.integer :game_id, null: false
      t.string :detail
    end
  end
end
