class AddUriToFoursquareReview < ActiveRecord::Migration
  def change
    add_column :foursquare_reviews, :wdw_uri, :text
  end
end
