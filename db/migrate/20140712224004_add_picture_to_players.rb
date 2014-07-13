class AddPictureToPlayers < ActiveRecord::Migration
  def up
    add_column :players, :picture, :string
  end

  def down
    remove_column :players, :picture
  end
end
