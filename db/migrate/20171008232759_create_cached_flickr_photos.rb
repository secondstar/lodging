class CreateCachedFlickrPhotos < ActiveRecord::Migration
  def change
    create_table :cached_flickr_photos do |t|
      t.string :owner
      t.string :secret
      t.string :server
      t.integer :farm
      t.string :title
      t.boolean :ispublic
      t.boolean :isfriend
      t.boolean :isfamily
      t.integer :hotel_id

      t.timestamps null: false
    end
  end
end
