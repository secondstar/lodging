class CachedFlickrPhoto < ActiveRecord::Base
	belongs_to :hotel
	has_many	:cached_flickr_photo_sizes

  scope :missing_sizes, -> { includes(:cached_flickr_photo_sizes).where(cached_flickr_photo_sizes: {id: nil}) }
  scope :tall_skinny_medium_sizes, -> { includes(:cached_flickr_photo_sizes).
  		where(cached_flickr_photo_sizes: {height: '640'}).
  		where(cached_flickr_photo_sizes: {label: "Medium 640"}) }
  scope :portrait_medium, -> { includes(:cached_flickr_photo_sizes).portrait.
      where(cached_flickr_photo_sizes: {label: "Medium 640"}) }
  scope :portrait, -> { includes(:cached_flickr_photo_sizes).where(cached_flickr_photo_sizes: {width_by_height: (0.001..0.99)}) }
  scope :landscape, -> { includes(:cached_flickr_photo_sizes).where(cached_flickr_photo_sizes: {width_by_height: (1.01..10.0)}) }
  scope :landscape_medium, -> { includes(:cached_flickr_photo_sizes).landscape.
      where(cached_flickr_photo_sizes: {width_by_height: (1.3..1.4)}).
      where(cached_flickr_photo_sizes: {label: "Medium 640"}) }

  def self._collect_tall_medium_for_hotel(hotel_id)
   	all_tall_photos = self.tall_skinny_medium_sizes
	tall_photos_for_one_hotel = all_tall_photos.where(hotel_id: hotel_id)
  end

  def self._collect_medium_sizes_for_tall_medium(photo_collection)
  	medium_sizes = []
  	photo_collection.each do |photo|
  		medium_size = photo.cached_flickr_photo_sizes.first
  		medium_sizes << medium_size
  	end
  	Array(medium_sizes)
  end

  def self.collect_featured_tall_photos(hotel_id)
    photo_collection = self._collect_tall_medium_for_hotel(hotel_id)
    photo_sizes =self._collect_medium_sizes_for_tall_medium(photo_collection)
    Array(photo_sizes)
  end
end
