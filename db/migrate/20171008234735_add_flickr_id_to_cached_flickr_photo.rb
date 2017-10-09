class AddFlickrIdToCachedFlickrPhoto < ActiveRecord::Migration
  def change
    add_column :cached_flickr_photos, :flickr_id, :string
  end
end
