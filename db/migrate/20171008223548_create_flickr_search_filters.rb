class CreateFlickrSearchFilters < ActiveRecord::Migration
  def change
    create_table :flickr_search_filters do |t|
      t.string :user_id
      t.string :tags
      t.string :tag_mode
      t.string :text
      t.string :min_upload_date
      t.string :max_upload_date
      t.string :min_taken_date
      t.string :max_taken_date
      t.string :license
      t.string :sort
      t.string :privacy_filter
      t.string :bbox
      t.string :accuracy
      t.string :safe_search
      t.string :content_type
      t.string :machine_tags
      t.string :machine_tag_mode
      t.string :group_id
      t.string :faves
      t.string :camera
      t.string :jump_to
      t.string :contacts
      t.string :woe_id
      t.string :place_id
      t.string :media
      t.string :has_geo
      t.string :geo_context
      t.string :lat
      t.string :lon
      t.string :radius
      t.string :radius_units
      t.string :is_commons
      t.string :in_gallery
      t.string :person_id
      t.string :is_getty
      t.string :username
      t.string :exif_min_exposure
      t.string :exif_max_exposure
      t.string :exif_min_aperture
      t.string :exif_max_aperture
      t.string :exif_min_focallen
      t.string :exif_max_focallen
      t.string :exclude_user_id
      t.string :extras
      t.string :per_page
      t.string :page
      t.belongs_to :hotel, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
