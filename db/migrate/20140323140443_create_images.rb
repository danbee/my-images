class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :user_id
      t.string :image_uid
      t.string :image_name

      t.timestamps
    end
  end
end
