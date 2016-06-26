class FoursquareConnection
  include HTTParty
  format :json
  

  DEFAULT_BASE_API_VERSION  = '2'
  DEFAULT_API_VERSION       = "20160609"
  DEFAULT_BASE_URI          = "https://api.foursquare.com"
  DEFAULT_QUERY             = {}
  DEFAULT_LAT_AND_LNG       = '28.37777,-81.56498'
  DEFAULT_RADIUS            = '6000'
  DEFAULT_FOURSQUARE_ID     = FOURSQUARE_ID
  DEFAULT_FOURSQUARE_SECRET = FOURSQUARE_SECRET
  DEFAULT_VENUE_ID          = ""

  base_uri DEFAULT_BASE_URI

  attr_reader :connection, :routes, :client_id, :client_secret, :base_api_version, :lat_and_lng, :api_version, :radius, :venue_id

  def initialize(options={})
    @base_api_version = options.fetch(:base_api_version, DEFAULT_BASE_API_VERSION)
    @api_version      = options.fetch(:api_version, DEFAULT_API_VERSION)
    @query            = options.fetch(:query, DEFAULT_QUERY)
    @lat_and_lng      = options.fetch(:lat_and_lng, DEFAULT_LAT_AND_LNG)
    @radius           = options.fetch(:lat_and_lng, DEFAULT_RADIUS)
    @client_id        = options.fetch(:credentials, DEFAULT_FOURSQUARE_ID)
    @client_secret    = options.fetch(:credentials, DEFAULT_FOURSQUARE_SECRET)
    @venue_id         = options.fetch(:venue_id, DEFAULT_VENUE_ID) 
    @connection       = self.class
  end

  def title
    "i am foursquare"
  end
  
  def query(params={})
    @query.update(params)
    client_id           = [:client_id, @client_id]
    client_secret       = [:client_secret, @client_secret]
    api_version         = [:v, @api_version]
    ll                  = [:ll, @lat_and_lng]
    radius              = [:radius, @radius]
    key_value_pairs     = [client_id, client_secret, api_version, ll]
    required_keys_hash  = Hash[key_value_pairs]
    required_keys_hash

    @query.merge(required_keys_hash)
  end

  def get(relative_path, query={})
    relative_path = add_api_version(relative_path)
    connection.get relative_path, query: @query.merge(query)
  end

  def the_relative_path
    relative_path = add_api_version(relative_path)
  end

  private

  attr_reader :connection

  def add_api_version(relative_path)
    "/#{api_version_path}#{relative_path}/#{@venue_id}"
  end

  def api_version_path
    "v#{@base_api_version}"
  end

end