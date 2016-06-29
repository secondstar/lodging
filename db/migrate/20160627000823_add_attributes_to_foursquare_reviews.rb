class AddAttributesToFoursquareReviews < ActiveRecord::Migration
  def change
    add_column :foursquare_reviews, :categories, :text
    add_column :foursquare_reviews, :referral_id, :string
    add_column :foursquare_reviews, :location, :text
    add_column :foursquare_reviews, :canonical_url, :text
    add_column :foursquare_reviews, :verified, :boolean
    add_column :foursquare_reviews, :dislike, :boolean
    add_column :foursquare_reviews, :ok, :boolean
    add_column :foursquare_reviews, :rating, :decimal, precision: 10, scale: 2
    add_column :foursquare_reviews, :rating_color, :string
    add_column :foursquare_reviews, :rating_signals, :string
    add_column :foursquare_reviews, :allow_menu_url_edit, :boolean
    add_column :foursquare_reviews, :specials, :string
  end
end
