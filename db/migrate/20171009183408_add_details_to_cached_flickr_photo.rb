class AddDetailsToCachedFlickrPhoto < ActiveRecord::Migration
  def change
    add_column :cached_flickr_photos, :rotation, :integer
    add_column :cached_flickr_photos, :originalformat, :string
    add_column :cached_flickr_photos, :haspeople, :integer
  end
end
