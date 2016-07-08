class Hotel < ActiveRecord::Base
  has_one :foursquare_review
  
  def tips
    # "tipe sher"
    # self.foursquare_venue_id
    # self.foursquare_review
    FoursquareReview.find_by(venue_id: self.foursquare_venue_id).tips
    # self.foursquare_review.tips
  end

  def photos
    # "pavlova"
    self.foursquare_review.photos
  end

  def foursquare_review
    FoursquareReview.find_by(venue_id: self.foursquare_venue_id) #|| FoursquareMissingVenue.new
  end
end
