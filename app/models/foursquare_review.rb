class FoursquareReview < ActiveRecord::Base
  has_many :foursquare_photos
  has_many :foursquare_tips
end
