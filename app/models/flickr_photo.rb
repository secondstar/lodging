class FlickrPhoto
  ## formerly used attempted to create FlickrClient and FlickrConnection, but they failed

  attr_reader :client, :lat, :lon, :radius, :per_page
  
  def initialize(api_key: FLICKR_ID, shared_secret: FLICKR_SECRET, lat:"", lon:"", radius:"", per_page: 200)
    @client     = FlickrClient.new.client
    @lat        = lat
    @lon        = lon
    @radius     = radius
    @per_page   = per_page
  end
	
  def title
	"i am flickr"
  end

  def search(text: "", per_page: self.per_page)
    responses = []
    search_results = self.client.photos.search(text: text, per_page: per_page)
    search_results.each do |photo|
      response        = OpenStruct.new(photo.to_hash)
      responses << response
    end
    responses
  end

  def get_info(photo_id:,secret:)
    photo = client.photos.getInfo(photo_id: photo_id, secret: secret)
    response        = OpenStruct.new(photo.to_hash)
  end

  def get_sizes(flickr_id)
      puts "*****************"
      puts "sizes for flickr_id: #{flickr_id}"
      puts "                 "
      puts "*****************"
    responses = []
    begin
      sizes = client.photos.getSizes(photo_id: flickr_id)
    rescue
       return responses
    end
    sizes.each do |photo|
      response        = OpenStruct.new(photo.to_hash)
      responses << response
    end
    responses
  end
end