class AddAlbumToImages < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :images, :album
  end
end
