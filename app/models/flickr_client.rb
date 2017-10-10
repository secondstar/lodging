require 'flickraw'

class FlickrClient

  attr_reader :client

  def initialize(api_key: FLICKR_ID, shared_secret: FLICKR_SECRET)
    FlickRaw.api_key= api_key
    FlickRaw.shared_secret= shared_secret

    @client = flickr
  end


  def title
    "i am flickr"
  end
  
end