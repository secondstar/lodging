class Hotel < ActiveRecord::Base
  has_one :foursquare_review
  
  def tips
    self.foursquare_review.foursquare_tips
  end

  def photos
    self.foursquare_review.foursquare_photos
  end

end
