class AddRaitioToCachedFlickrPhotoSize < ActiveRecord::Migration
  def change
    add_column :cached_flickr_photo_sizes, :width_by_height, :float
  end
end
