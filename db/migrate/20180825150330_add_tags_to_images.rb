class AddTagsToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :tags, :string, array: true, default: []
  end
end
