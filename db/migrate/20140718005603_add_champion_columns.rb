class AddChampionColumns < ActiveRecord::Migration
  def up
    add_column :leagues, :champion_id, :integer
    add_column :users, :titles, :integer, default: 0
  end

  def down
    remove_column :leagues, :champion
    remove_column :users, :titles
  end
end
