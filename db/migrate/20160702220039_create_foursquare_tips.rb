class CreateFoursquareTips < ActiveRecord::Migration
  def change
    create_table :foursquare_tips do |t|
      t.string :venue_id
      t.string :text
      t.string :tip_kind
      t.text :canonical_url
      t.string :lang
      t.text :likes
      t.integer :agree_count
      t.integer :disagree_count

      t.timestamps null: false
    end
  end
end
