class AddAuthorToFoursquareTips < ActiveRecord::Migration
  def change
    add_column :foursquare_tips, :foursquare_author_id, :string
    add_column :foursquare_tips, :author_first_name, :string
    add_column :foursquare_tips, :author_last_name, :string
    add_column :foursquare_tips, :author_gender, :string
    add_column :foursquare_tips, :author_photo_prefix, :string
    add_column :foursquare_tips, :author_photo_suffix, :string
  end
end
