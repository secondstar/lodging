class CachedFlickrPhotoSize < ActiveRecord::Base
  belongs_to :cached_flickr_photo

    scope :missing_ratio, -> { where(width_by_height: nil) }
    scope :last_week,   lambda { where("created_at < ?", Time.zone.now ) }
    scope :portrait,    lambda { where("width_by_height < ?", 1 ) }
    scope :landscape,   lambda { where("width_by_height > ?", 1 ) }
    scope :medium,      lambda { where(width_by_height: (1.3..1.4)) }

    def self.add_width_height_ratio_to_sizes_missing_ratio
    	sizes = self.missing_ratio
    	sizes.each do |size|
    		self.add_width_height_ratio(size)
    	end
    end

	def self.add_width_height_ratio(size)
		ratio = caculate_width_height_ratio(width: size.width, height: size.height)
		size.update(width_by_height: ratio)
	end

	def self.caculate_width_height_ratio(width:,height:)
		ratio = width.to_f / height.to_f
	end
end
