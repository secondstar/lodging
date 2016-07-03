class AddFoursquareTipIdToFoursquareTips < ActiveRecord::Migration
  def change
    add_column :foursquare_tips, :foursquare_id, :string
  end
end
