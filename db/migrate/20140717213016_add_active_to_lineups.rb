class AddActiveToLineups < ActiveRecord::Migration
  def up
    add_column :lineups, :active, :boolean, default: false
  end

  def down
    remove_column :lineups, :active
  end
end
