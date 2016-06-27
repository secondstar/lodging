class CreateFoursquarePhotos < ActiveRecord::Migration
  def change
    create_table :foursquare_photos do |t|
      t.string :source
      t.string :prefix
      t.string :suffix
      t.integer :width
      t.integer :height
      t.string :visibility
      t.string :foursquare_user_id
      t.string :foursquare_photo_id

      t.timestamps null: false
    end
  end
end
