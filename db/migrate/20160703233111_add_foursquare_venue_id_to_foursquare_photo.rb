class AddFoursquareVenueIdToFoursquarePhoto < ActiveRecord::Migration
  def change
    add_column :foursquare_photos, :foursquare_venue_id, :string
  end
end
