class AddPhotographerToFoursquarePhoto < ActiveRecord::Migration
  def change
    add_column :foursquare_photos, :photographer_first_name, :string
    add_column :foursquare_photos, :photographer_last_name, :string
  end
end
