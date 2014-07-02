class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :team_id
      t.string :first_name
      t.string :last_name, null: false
      t.integer :batting_contact, null: false
      t.integer :batting_power, null: false
      t.integer :pitching_craftiness, null: false
      t.integer :pitching_accuracy, null: false
      t.integer :fielding, null: false
      t.integer :speed, null: false
    end
  end
end
