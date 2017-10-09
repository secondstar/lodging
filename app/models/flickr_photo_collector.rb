class FlickrPhotoCollector
	  attr_reader :hotels
	def initialize(hotels: Hotel.all.select(:id, :name))
		@hotels = hotels
	end
	
	def find(hotel)
		photos = FlickrPhoto.new.search(text: hotel.name)
		photos.each do |photo|
			photo.hotel_id = hotel.id
		end
		photos
	end	

	def all
		all_photos = []
		hotels.each do |hotel|
			puts "hotel: #{hotel.name}"
			photos = find(hotel)
			all_photos << photos
		end
		all_photos
	end

	def cache_photos(photo_collection)
		photos = photo_collection.flatten
		photos.each do |photo|
			prepare_attributes_for_storage(photo)
			hotel_photo = CachedFlickrPhoto.find_or_create_by(flickr_id: photo.flickr_id)
			hotel_photo.update(photo.to_h)
		end
	end

	def prepare_attributes_for_storage(photo)
		#move "id" to "flickr_id"
		photo.flickr_id = photo.id.to_s
		photo.delete_field("id")
		# convert from 0/1 to boolean
		photo.ispublic = to_boolean(photo.ispublic)
		photo.isfriend = to_boolean(photo.isfriend)
		photo.isfamily = to_boolean(photo.isfamily)
	end

	def to_boolean(value)
		['true',1,'1',true].include?(value)
	end
end
