class CreateOutKeepers < ActiveRecord::Migration
  def change
    create_table :out_keepers do |t|
      t.integer :pitcher_id
      t.integer :batter_id
      t.string :detail
    end
  end
end
