class AddLeagueIdToTeams < ActiveRecord::Migration
  def up
    add_column :teams, :league_id, :integer
  end

  def down
    remove_column :teams, :league_id
  end
end
