class AddFoursquareReviewIdToFoursquareTip < ActiveRecord::Migration
  def change
    add_reference :foursquare_tips, :foursquare_review, index: true, foreign_key: true
  end
end
