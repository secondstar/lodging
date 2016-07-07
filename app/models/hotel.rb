class Hotel < ActiveRecord::Base
  has_one :foursquare_review
  
  def tips
    self.foursquare_review.tips
  end

  def photos
    self.foursquare_review.photos
  end

  def foursquare_review
    # self.foursquare_venue_id
    FoursquareReview.find_by(venue_id: self.foursquare_venue_id) #|| FoursquareMissingVenue.new
  end
end
