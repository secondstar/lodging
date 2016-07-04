class FoursquarePhoto < ActiveRecord::Base
  belongs_to :foursquare_review
  belongs_to :foursquare_review, :class_name => "FoursquareReview", :foreign_key => "foursquare_id"
end
