class CreateCachedFlickrPhotoSizes < ActiveRecord::Migration
  def change
    create_table :cached_flickr_photo_sizes do |t|
      t.string :label
      t.string :width
      t.string :height
      t.text :source
      t.text :url
      t.string :media
      t.belongs_to :cached_flickr_photo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
