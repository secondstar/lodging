class CreateFoursquareReviews < ActiveRecord::Migration
  def change
    create_table :foursquare_reviews do |t|
      t.string :foursquare_id
      t.string :name
      t.string :address
      t.string :cross_street
      t.string :lat
      t.string :lng
      t.string :alt_venues
      t.string :searched_for
      t.datetime :archived_at

      t.timestamps null: false
    end
  end
end
