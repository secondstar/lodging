class FlickrPhoto
  ## formerly used attempted to create FlickrClient and FlickrConnection, but they failed

  attr_reader :client, :lat, :lon, :radius
  
  def initialize(api_key: FLICKR_ID, shared_secret: FLICKR_SECRET, lat:"", lon:"", radius:"")
    @client     = FlickrClient.new.client
    @lat        = lat
    @lon        = lon
    @radius     = radius
  end
	
  def title
	"i am flickr"
  end

  def search(text: "")
    responses = []
    search_results = self.client.photos.search(text: text)
    search_results.each do |photo|
      response        = OpenStruct.new(photo.to_hash)
      responses << response
    end
    responses
  end

end