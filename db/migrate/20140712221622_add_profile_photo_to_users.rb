class AddProfilePhotoToUsers < ActiveRecord::Migration
  def up
    add_column :users, :profile_photo, :string
  end

  def down
    remove_column :users, :profile_photo
  end
end
