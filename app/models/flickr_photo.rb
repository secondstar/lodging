class FlickrPhoto
  ## formerly used attempted to create FlickrClient and FlickrConnection, but they failed

  attr_reader :client, :lat, :lon, :radius
  
  def initialize(api_key: FLICKR_ID, shared_secret: FLICKR_SECRET, lat:"", lon:"", radius:"")
    @client     = FlickrClient.new.client.photos
    @lat        = lat
    @lon        = lon
    @radius     = radius
  end
	
  def title
	"i am flickr"
  end

  def search(search_term)
    responses = []
    client.search(text: search_term)
    # search_results = client.search(text: search_term)
    # search_results.each do |photo|
    #   response        = OpenStruct.new(photo)
    #   responses << response
    # end
    # responses
  end

end