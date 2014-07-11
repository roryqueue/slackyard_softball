class AddUserIdToTeams < ActiveRecord::Migration
  def up
    add_column :teams, :user_id, :integer, null: false
  end

  def down
    remove_column :teams, :user_id
  end
end
