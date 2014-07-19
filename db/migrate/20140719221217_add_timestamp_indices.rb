class AddTimestampIndices < ActiveRecord::Migration
  def change
    add_index :games, :created_at
    add_index :games, :updated_at
    add_index :score_keepers, :created_at
    add_index :score_keepers, :updated_at
    add_index :stat_keepers, :created_at
    add_index :stat_keepers, :updated_at
  end
end
