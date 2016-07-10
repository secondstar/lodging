class AddHotelIdToFoursquareReview < ActiveRecord::Migration
  def change
    add_reference :foursquare_reviews, :hotel, index: true, foreign_key: true
  end
end
