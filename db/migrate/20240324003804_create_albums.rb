class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.belongs_to :user

      t.timestamps
    end
  end
end
