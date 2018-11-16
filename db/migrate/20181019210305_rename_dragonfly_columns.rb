class RenameDragonflyColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :image_uid, :df_image_uid
    rename_column :images, :image_name, :df_image_name
  end
end
