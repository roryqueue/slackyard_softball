class AddPictureToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :picture, :string
  end
end
