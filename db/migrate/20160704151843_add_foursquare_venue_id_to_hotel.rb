class AddFoursquareVenueIdToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :foursquare_venue_id, :string
  end
end
