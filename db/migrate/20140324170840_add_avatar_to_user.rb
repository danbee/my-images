class AddAvatarToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar_uid, :string
  end
end
