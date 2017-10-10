class AddDescriptionToCachedFlickrPhoto < ActiveRecord::Migration
  def change
    add_column :cached_flickr_photos, :description_content, :text
  end
end
