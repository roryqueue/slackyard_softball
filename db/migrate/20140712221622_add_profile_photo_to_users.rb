class AddProfilePhotoToUsers < ActiveRecord::Migration
  def change
  def change
    add_column :users, :profile_photo, :string
  end
  end
end
