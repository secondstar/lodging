class FlickrPhotoCollector
	  attr_reader :hotels
	def initialize(hotels: Hotel.all.select(:id, :name))
		@hotels = hotels
	end
	
	def find(hotel)
		photos = FlickrPhoto.new.search(text: hotel.name)
		photos.each do |photo|
			photo.hotel_id 				= hotel.id
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
			hotel_photo = CachedFlickrPhoto.find_or_create_by(flickr_id: photo.flickr_id)
			return if hotel_photo.originalformat.to_s.length > 0
			self.prepare_attributes_for_storage(photo)
			hotel_photo.update(photo.to_h)
		end
	end

	def prepare_attributes_for_storage(photo)
		puts "### preparing #{photo.id} #{photo.title} ###"
		#move "id" to "flickr_id"
		photo.flickr_id = photo.id.to_s
		photo.delete_field("id")
		# convert from 0/1 to boolean
		photo.ispublic = self.to_boolean(photo.ispublic)
		photo.isfriend = self.to_boolean(photo.isfriend)
		photo.isfamily = self.to_boolean(photo.isfamily)

		#add details to photo for better selection for display
		photo_info 	   				= FlickrPhoto.new.
										get_info(photo_id: photo.flickr_id ,secret: photo.secret)
		photo.rotation 				= photo_info.rotation
		photo.description_content 	= photo_info.description_content
		photo.originalformat		= photo_info.originalformat
		photo.haspeople				= photo_info.haspeople
		# need to sleep to not max out QPS (queries per second)
		puts "**** sleep ****"
		sleep 1			
	end

	def to_boolean(value)
		['true',1,'1',true].include?(value)
	end

	def _add_sizes_to_cached_photos
		photos_without_sizes 			= CachedFlickrPhoto.missing_sizes
		photos_without_sizes.each do |photo|
			sizes = FlickrPhoto.new.get_sizes(photo.flickr_id)
			sizes.each do |size|
				size.width_by_height = self.caculate_width_height_ratio(width: size.width, height: size.height)
				cs = photo.cached_flickr_photo_sizes.find_or_create_by(source: size.source) 
				cs.update(size.to_h)
			end
			puts "**** sleep ****"
			sleep 0.5
		end


	end

	def caculate_width_height_ratio(width:,height:)
		ratio = width.to_f / height.to_f
	end

	def _calculate_and_save_missing_width_height_ratios
		sizes_without_width_by_height	= CachedFlickrPhotoSize.where(width_by_height: nil)
		missing_ratios = sizes_without_width_by_height.count
		puts "Missing #{missing_ratios} ratios"
		sizes_without_width_by_height.each do |size|
			ratio = self.caculate_width_height_ratio(width: size.width, height: size.height)
			size.update(width_by_height: ratio)
		end		
	end
end
