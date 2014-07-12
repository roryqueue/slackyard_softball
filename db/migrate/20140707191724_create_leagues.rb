class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name, null: false, unique: true
      t.integer :commissioner_id, null: false

      t.timestamps
    end
  end
end
