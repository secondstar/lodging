class FoursquareReview < ActiveRecord::Base
  belongs_to :hotel
  
  def tips
    FoursquareTip.where(venue_id: venue_id)
  end
  
  def photos
    FoursquarePhoto.where(foursquare_venue_id: venue_id)
  end
end
