require 'foursquare2'
class Foursquare2Client

  DEFAULT_API_VERSION       = "20160609"
  DEFAULT_QUERY             = {}
  DEFAULT_LAT_AND_LNG       = '28.37777,-81.56498'
  DEFAULT_RADIUS            = '6000'
  DEFAULT_FOURSQUARE_ID     = FOURSQUARE_ID
  DEFAULT_FOURSQUARE_SECRET = FOURSQUARE_SECRET
  DEFAULT_VENUE_ID          = ""

  attr_reader :client_id, :client_secret, :lat_and_lng, :api_version, :radius, :ll

  def initialize(options={})
    @api_version      = options.fetch(:api_version, DEFAULT_API_VERSION)
    @query            = options.fetch(:query, DEFAULT_QUERY)
    @ll      = options.fetch(:lat_and_lng, DEFAULT_LAT_AND_LNG)
    @radius           = options.fetch(:lat_and_lng, DEFAULT_RADIUS)
    @client_id        = options.fetch(:credentials, DEFAULT_FOURSQUARE_ID)
    @client_secret    = options.fetch(:credentials, DEFAULT_FOURSQUARE_SECRET)
    @venue_id         = options.fetch(:venue_id, DEFAULT_VENUE_ID) 
  end

  def title
    "i am foursquare2"
  end
  
  def client
    client = Foursquare2::Client.new(:client_id => client_id, :client_secret => client_secret, :api_version => self.api_version, :ll => self.ll)    
  end
end
