class RenameColumnFoursqaureIdInFoursquareReviewToVenueId < ActiveRecord::Migration
  def change
    rename_column :foursquare_reviews, :foursquare_id, :venue_id
      
  end
end
